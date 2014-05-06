//
// Created by Kamil Borzym on 25.04.2014.
// Copyright (c) 2014 Killer Ball. All rights reserved.
//

#import "KBAppDelegate.h"
#import "KBTemplateImageDemoViewController.h"

@implementation KBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[KBTemplateImageDemoViewController alloc] init]];
    [self.window makeKeyAndVisible];
    return YES;
}

@end