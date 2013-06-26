//
//  lcallbenchmark.c
//  LuaCallBenchmark
//
//  Created by Eric Wing on 6/23/13.
//  Copyright (c) 2013 PlayControl Software LLC. All rights reserved.
//


#include <stdio.h>
#ifdef __ANDROID__
#undef fprintf
#include <android/log.h>
#define fprintf(stderr, ...) __android_log_print(ANDROID_LOG_INFO, "ALmixer", __VA_ARGS__)
#endif

#if defined(__APPLE__)
#include <QuartzCore/QuartzCore.h>
#include <unistd.h>
static CFTimeInterval s_ticksBaseTime = 0.0;

#elif defined(_WIN32)
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <winbase.h>
LARGE_INTEGER s_hiResTicksPerSecond;
double s_hiResSecondsPerTick;
LARGE_INTEGER s_ticksBaseTime;
#else
#include <unistd.h>
#include <time.h>
static struct timespec s_ticksBaseTime;
#endif

extern void CallBenchmark_InitTime()
{
#if defined(__APPLE__)
	s_ticksBaseTime = CACurrentMediaTime();
	
#elif defined(_WIN32)
	LARGE_INTEGER hi_res_ticks_per_second;
	if(TRUE == QueryPerformanceFrequency(&hi_res_ticks_per_second))
	{
		QueryPerformanceCounter(&s_ticksBaseTime);
		s_hiResSecondsPerTick = 1.0 / hi_res_ticks_per_second;
	}
	else
	{
		fprintf(stderr, "Windows error: High resolution clock failed. Audio will not work correctly.\n");
	}
#else
	/* clock_gettime is POSIX.1-2001 */
	clock_gettime(CLOCK_MONOTONIC, &s_ticksBaseTime);
#endif
	
}

extern unsigned int CallBenchmark_GetTicks()
{
#if defined(__APPLE__)
	return (unsigned int)((CACurrentMediaTime()-s_ticksBaseTime)*1000.0);
#elif defined(_WIN32)
	LARGE_INTEGER current_time;
	QueryPerformanceCounter(&current_time);
	return (unsigned int)((current_time.QuadPart - s_ticksBaseTime.QuadPart) * 1000 * s_hiResSecondsPerTick);
#else /* assuming POSIX */
	/* clock_gettime is POSIX.1-2001 */
	struct timespec current_time;
	clock_gettime(CLOCK_MONOTONIC, &current_time);
	return (unsigned int)((current_time.tv_sec - s_ticksBaseTime.tv_sec)*1000.0 + (current_time.tv_nsec - s_ticksBaseTime.tv_nsec) / 1000000);
#endif
}

extern void CallBenchmark_Delay(unsigned int milliseconds_delay)
{
#if defined(_WIN32)
	Sleep(milliseconds_delay);
#else
	usleep(milliseconds_delay*1000);
#endif
}


#include "lua.h"
#include "lauxlib.h"

/* These are idealized functions for benchmarking purposes. I'm interested in theoretical maximums for now.
 * Longer term, it would be nice to compare against argument checking performance.
 */
static int lcallbenchmark_emptyCall(lua_State* lua_state)
{
	return 0;
}

static int lcallbenchmark_returnDouble(lua_State* lua_state)
{
	lua_pushnumber(lua_state, 1234.5);
	return 1;
}

static int lcallbenchmark_returnString(lua_State* lua_state)
{
	lua_pushliteral(lua_state, "Hello World");
	return 1;
}


static int lcallbenchmark_passDouble(lua_State* lua_state)
{
	double val = lua_tonumber(lua_state, 1);
	return 0;
}

static int lcallbenchmark_passString(lua_State* lua_state)
{
	const char* val = lua_tostring(lua_state, 1);
	return 0;
}

static int lcallbenchmark_passAndReturnDouble(lua_State* lua_state)
{
	double val = lua_tonumber(lua_state, 1);
	/* We will go through the effort of pushing a number to similate the possibility of returning a different number. */
	/* We don't actually need to clear the stack as an optimization since Lua will return from the top. */
	lua_pushnumber(lua_state, val);
	return 1;
}


static int lcallbenchmark_passAndReturnString(lua_State* lua_state)
{
	size_t str_len;
	const char* val = lua_tolstring(lua_state, 1, &str_len);
	/* We will go through the effort of pushing a string to similate the possibility of returning a different string. */
	/* We don't actually need to clear the stack as an optimization since Lua will return from the top. */
	lua_pushlstring(lua_state, val, str_len);
	return 1;
}


static int lcallbenchmark_pass2Double(lua_State* lua_state)
{
	double val1 = lua_tonumber(lua_state, 1);
	double val2 = lua_tonumber(lua_state, 2);
	return 0;
}

static int lcallbenchmark_pass2String(lua_State* lua_state)
{
	const char* val1 = lua_tostring(lua_state, 1);
	const char* val2 = lua_tostring(lua_state, 2);
	return 0;
}

static int lcallbenchmark_getTicks(lua_State* lua_state)
{
	lua_pushinteger(lua_state, CallBenchmark_GetTicks());
	return 1;
}

static int lcallbenchmark_delay(lua_State* lua_state)
{
	double val = lua_tointeger(lua_state, 1);
	CallBenchmark_Delay(val);
	return 0;
}


static const luaL_Reg lcallbenchmark_lib[] =
{
	{"emptyCall", lcallbenchmark_emptyCall},
	{"returnDouble", lcallbenchmark_returnDouble},
	{"returnString", lcallbenchmark_returnString},
	{"passDouble", lcallbenchmark_passDouble},
	{"passString", lcallbenchmark_passString},
	{"passAndReturnDouble", lcallbenchmark_passAndReturnDouble},
	{"passAndReturnString", lcallbenchmark_passAndReturnString},
	{"pass2Double", lcallbenchmark_pass2Double},
	{"pass2String", lcallbenchmark_pass2String},

	{"getTicks", lcallbenchmark_getTicks},
	{"delay", lcallbenchmark_delay},

	{NULL, NULL}
};


/*
** Open library
*/
extern int luaopen_callbenchmark(lua_State* lua_state)
{
	CallBenchmark_InitTime();
	luaL_register(lua_state, "callbenchmark", lcallbenchmark_lib);
	return 1;
}

