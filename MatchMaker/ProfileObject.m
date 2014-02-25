//
//  ProfileObject.m
//  MatchMaker
//
//  Created by Yury Yaschenko on 2/25/14.
//  Copyright (c) 2014 Backendless. All rights reserved.
//

#import "ProfileObject.h"
@interface ProfileObject()
{
    NSDictionary *_profile;
}
-(NSDictionary *)getAllProfileValues;
@end
@implementation ProfileObject
-(id)init
{
    self = [super init];
    if (self) {
        _profile = [self getAllProfileValues];
    }
    return self;
}

-(NSDictionary *)getAllProfileValues
{
    return  @{
              @"Food":@[@"Asian", @"Caribean", @"Bar food", @"French", @"Mediterranean", @"Greek", @"Spanish", @"Mexican", @"Thai"],
              @"Music":@[@"Classical", @"Jazz", @"Hip-hop", @"Reggae", @"Blues", @"Trance", @"House", @"Rock", @"Folk"],
              @"Hobbies":@[@"Fishing", @"Diving", @"Rock climbing", @"Hiking", @"Reading", @"Dancing", @"Cooking", @"Surfing", @"Photography"],
              @"Travel":@[@"Cruise", @"B&B", @"Europe", @"Asia", @"Caribean", @"Mountains", @"Whale watching", @"Active travel", @"Passive travel"]
              };
}
-(NSString *)getGroupNameForIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return @"Food";
        case 1:
            return @"Music";
        case 2:
            return @"Hobbies";
        case 3:
            return @"Travel";
        default:
            return @"Food";
            break;
    }
}
-(NSArray *)getGroupValuesForIndex:(NSUInteger)index
{
    return _profile[[self getGroupNameForIndex:index]];
}
@end
