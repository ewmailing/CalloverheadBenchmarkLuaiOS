//
//  ViewController.m
//  LuaCallBenchmark
//
//  Created by Eric Wing on 6/23/13.
//  Copyright (c) 2013 PlayControl Software LLC. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

#include "lua.h"
#include "lauxlib.h"

static int report (lua_State *L, int status) {
	const char *msg;
	if (status) {
		msg = lua_tostring(L, -1);
		if (msg == NULL) msg = "(error with no message)";
		NSLog(@"status=%d, %s\n", status, msg);
		lua_pop(L, 1);
	}
	return status;
}

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) benchmarkEmptyCall:(id)the_sender
{
	int elapsed_time;
	struct lua_State* lua_state;
	int ret_flag;
	AppDelegate* app_delegate;
	app_delegate = [[UIApplication sharedApplication] delegate];
	lua_state = [app_delegate luaState];
	
	/* Collect full to make sure benchmark is in clean state before running. */
	lua_gc(lua_state, LUA_GCCOLLECT, 0);

	lua_getglobal(lua_state, "BenchmarkEmptyCall");
	ret_flag = lua_pcall(lua_state, 0, 1, 0);
	if(0 != ret_flag)
	{
		report(lua_state, ret_flag);
	}
	elapsed_time = lua_tointeger(lua_state, -1);
	lua_pop(lua_state, 1);
	NSLog(@"Elapsed time for emptyCall (ms): %d", elapsed_time);
}

- (IBAction) benchmarkReturnDouble:(id)the_sender
{
	int elapsed_time;
	struct lua_State* lua_state;
	int ret_flag;
	AppDelegate* app_delegate;
	app_delegate = [[UIApplication sharedApplication] delegate];
	lua_state = [app_delegate luaState];
	
	/* Collect full to make sure benchmark is in clean state before running. */
	lua_gc(lua_state, LUA_GCCOLLECT, 0);

	lua_getglobal(lua_state, "BenchmarkReturnDouble");
	ret_flag = lua_pcall(lua_state, 0, 1, 0);
	if(0 != ret_flag)
	{
		report(lua_state, ret_flag);
	}
	elapsed_time = lua_tointeger(lua_state, -1);
	lua_pop(lua_state, 1);
	NSLog(@"Elapsed time for returnDouble (ms): %d", elapsed_time);
}

- (IBAction) benchmarkPassDouble:(id)the_sender
{
	int elapsed_time;
	struct lua_State* lua_state;
	int ret_flag;
	AppDelegate* app_delegate;
	app_delegate = [[UIApplication sharedApplication] delegate];
	lua_state = [app_delegate luaState];
	
	/* Collect full to make sure benchmark is in clean state before running. */
	lua_gc(lua_state, LUA_GCCOLLECT, 0);
	
	lua_getglobal(lua_state, "BenchmarkPassDouble");
	ret_flag = lua_pcall(lua_state, 0, 1, 0);
	if(0 != ret_flag)
	{
		report(lua_state, ret_flag);
	}
	elapsed_time = lua_tointeger(lua_state, -1);
	lua_pop(lua_state, 1);
	NSLog(@"Elapsed time for passDouble (ms): %d", elapsed_time);
}

- (IBAction) benchmarkPassAndReturnDouble:(id)the_sender
{
	int elapsed_time;
	struct lua_State* lua_state;
	int ret_flag;
	AppDelegate* app_delegate;
	app_delegate = [[UIApplication sharedApplication] delegate];
	lua_state = [app_delegate luaState];
	
	/* Collect full to make sure benchmark is in clean state before running. */
	lua_gc(lua_state, LUA_GCCOLLECT, 0);
	
	lua_getglobal(lua_state, "BenchmarkPassAndReturnDouble");
	ret_flag = lua_pcall(lua_state, 0, 1, 0);
	if(0 != ret_flag)
	{
		report(lua_state, ret_flag);
	}
	elapsed_time = lua_tointeger(lua_state, -1);
	lua_pop(lua_state, 1);
	NSLog(@"Elapsed time for passAndReturnDouble (ms): %d", elapsed_time);
}

- (IBAction) benchmarkPass2Double:(id)the_sender
{
	int elapsed_time;
	struct lua_State* lua_state;
	int ret_flag;
	AppDelegate* app_delegate;
	app_delegate = [[UIApplication sharedApplication] delegate];
	lua_state = [app_delegate luaState];
	
	/* Collect full to make sure benchmark is in clean state before running. */
	lua_gc(lua_state, LUA_GCCOLLECT, 0);
	
	lua_getglobal(lua_state, "BenchmarkPass2Double");
	ret_flag = lua_pcall(lua_state, 0, 1, 0);
	if(0 != ret_flag)
	{
		report(lua_state, ret_flag);
	}
	elapsed_time = lua_tointeger(lua_state, -1);
	lua_pop(lua_state, 1);
	NSLog(@"Elapsed time for pass2Double (ms): %d", elapsed_time);
}


- (IBAction) benchmarkLuaEmptyCall:(id)the_sender
{
	int elapsed_time;
	struct lua_State* lua_state;
	int ret_flag;
	AppDelegate* app_delegate;
	app_delegate = [[UIApplication sharedApplication] delegate];
	lua_state = [app_delegate luaState];
	
	/* Collect full to make sure benchmark is in clean state before running. */
	lua_gc(lua_state, LUA_GCCOLLECT, 0);
	
	lua_getglobal(lua_state, "BenchmarkLuaEmptyCall");
	ret_flag = lua_pcall(lua_state, 0, 1, 0);
	if(0 != ret_flag)
	{
		report(lua_state, ret_flag);
	}
	elapsed_time = lua_tointeger(lua_state, -1);
	lua_pop(lua_state, 1);
	NSLog(@"Elapsed time for LuaEmptyCall (ms): %d", elapsed_time);
}



@end
