//
//  ProfileObject.h
//  MatchMaker
//
//  Created by Yury Yaschenko on 2/25/14.
//  Copyright (c) 2014 Backendless. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProfileObject : NSObject
-(NSString *)getGroupNameForIndex:(NSUInteger)index;
-(NSArray *)getGroupValuesForIndex:(NSUInteger)index;
@end
