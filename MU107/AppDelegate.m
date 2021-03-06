//
//  AppDelegate.m
//  MU107
//
//  Created by Igor Tomych on 16/01/14.
//  Copyright (c) 2014 Igor Tomych. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window.tintColor = [UIColor colorWithRed:0.94f green:0.94f blue:0.93f alpha:1.f];

    return YES;
}

-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    NSLog(@"%@", url);
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([url.absoluteString hasPrefix:@"fb196659450519064"])
    {
        NSString *token = @"test_tocken";
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"FACEBOOKTOKEN" object:token];
    }
    
    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
