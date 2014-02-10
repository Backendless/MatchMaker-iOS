//
//  NSString+Date.m
//  MatchMaker
//
//  Created by Yury Yaschenko on 2/10/14.
//  Copyright (c) 2014 Backendless. All rights reserved.
//

#import "NSString+Date.h"

@implementation NSString (Date)
+(NSString *)stringWithDateFormat:(NSString *)dateFormat date:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    NSString *resultString = [formatter stringFromDate:date];
    return resultString;
}
@end
