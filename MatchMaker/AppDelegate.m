//
//  AppDelegate.m
//  MatchMaker
//
//  Created by Yury Yaschenko on 2/4/14.
//  Copyright (c) 2014 Backendless. All rights reserved.
//

#import "AppDelegate.h"
#import "Backendless.h"
#import <CoreLocation/CoreLocation.h>

CLLocationManager *_locationManagerInstance;

static NSString *APP_ID = @"03140D8F-76C4-F4F7-FF71-C5FDAAB22900";
static NSString *SECRET_KEY = @"0E47A528-81B5-C5F9-FF44-713F6CF30900";
static NSString *VERSION_NUM = @"v1";

@implementation AppDelegate
-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    [DebLog setIsActive:YES];
    BackendlessUser *user = [backendless.userService handleOpenURL:url];
    if (user) {
        
    }
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [DebLog setIsActive:YES];
    
    [backendless initApp:APP_ID secret:SECRET_KEY version:VERSION_NUM];
    
    _locationManagerInstance = [[CLLocationManager alloc] init];
    [_locationManagerInstance startUpdatingLocation];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    [_locationManagerInstance stopUpdatingLocation];
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
    [_locationManagerInstance startUpdatingLocation];
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
