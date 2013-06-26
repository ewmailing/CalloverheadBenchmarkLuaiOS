//
//  AppDelegate.h
//  LuaCallBenchmark
//
//  Created by Eric Wing on 6/23/13.
//  Copyright (c) 2013 PlayControl Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "lua.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property(strong, nonatomic) UIWindow* window;
@property(nonatomic, readonly, assign) lua_State* luaState;

@end
