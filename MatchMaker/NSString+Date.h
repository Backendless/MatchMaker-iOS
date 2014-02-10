//
//  NSString+Date.h
//  MatchMaker
//
//  Created by Yury Yaschenko on 2/10/14.
//  Copyright (c) 2014 Backendless. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Date)
+(NSString *)stringWithDateFormat:(NSString*)dateFormat date:(NSDate *)date;
@end
