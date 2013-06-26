//
//  AppDelegate.m
//  LuaCallBenchmark
//
//  Created by Eric Wing on 6/23/13.
//  Copyright (c) 2013 PlayControl Software LLC. All rights reserved.
//

#import "AppDelegate.h"
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

extern int luaopen_callbenchmark(lua_State* lua_state);


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
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	struct lua_State* lua_state;
	int ret_flag;
    // Override point for customization after application launch.
	lua_state = luaL_newstate();
	_luaState = lua_state;
	
	lua_pushcfunction(lua_state, luaopen_base);
	lua_pushliteral(lua_state, "");
	lua_call(lua_state, 1, 0);
	
	lua_pushcfunction(lua_state, luaopen_package);
	lua_pushliteral(lua_state, "package");
	lua_call(lua_state, 1, 0);
	
	// Load my benchmark library/module
	lua_pushcfunction(lua_state, luaopen_callbenchmark);
	lua_pushliteral(lua_state, "callbenchmark");
	lua_call(lua_state, 1, 0);
	
	NSString* script_path_and_file = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"benchmark.lua"];
	ret_flag = luaL_loadfile(lua_state, [script_path_and_file fileSystemRepresentation]);
	if(0 != ret_flag)
	{
		report(lua_state, ret_flag);
		
	}
	else
	{
		ret_flag = lua_pcall(lua_state, 0, 0, 0);
		if(0 != ret_flag)
		{
			report(lua_state, ret_flag);
		}
	}
	
	
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
