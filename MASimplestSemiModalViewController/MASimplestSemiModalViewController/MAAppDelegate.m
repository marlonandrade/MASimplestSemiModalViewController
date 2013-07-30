//
//  MAAppDelegate.m
//  MASimplestSemiModalViewController
//
//  Created by Marlon Andrade on 30/07/13.
//  Copyright (c) 2013 Marlon Andrade. All rights reserved.
//

#import "MAAppDelegate.h"

#import "MAMainViewController.h"

@implementation MAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[MAMainViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
