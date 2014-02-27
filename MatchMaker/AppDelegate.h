//
//  AppDelegate.h
//  MatchMaker
//
//  Created by Yury Yaschenko on 2/4/14.
//  Copyright (c) 2014 Backendless. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CLLocationManager, GeoPoint;
extern CLLocationManager *_locationManagerInstance;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) GeoPoint *userGeoPoint;
-(void)updateGeopoint;
@end
