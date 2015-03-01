//
//  DateHelp.m
//  DateHelp
//
//  Created by massimo on 15/3/1.
//  Copyright (c) 2015年 massimo. All rights reserved.
//

#import "DateHelp.h"

@implementation DateHelp
+ (NSString*)getDate:(DateType)dateType andSinceNow:(NSInteger)dayNum{
    NSInteger dis = dayNum; //前后的天数
    
    NSDate*nowDate = [NSDate date];
    NSDate* theDate;
    
    if(dis!=0)
    {
        NSTimeInterval  oneDay = 24*60*60*1;  //1天的长度
        
        theDate = [nowDate initWithTimeIntervalSinceNow: +oneDay*dis ];
        //or
        //        theDate = [nowDate initWithTimeIntervalSinceNow: -oneDay*dis ];
    }
    else
    {
        theDate = nowDate;
    }
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *dateComponent = [calendar components:calendarUnit fromDate:theDate];
    
    NSCalendar  * cal=[NSCalendar  currentCalendar];
    NSUInteger  unitFlags=NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents * conponent= [cal components:unitFlags fromDate:theDate];
    NSInteger year = [conponent year];
    NSInteger month = [conponent month];
    NSInteger day = [conponent day];
    NSInteger hour = [conponent hour];
    NSInteger minute = [conponent minute];
    NSInteger second = [conponent second];
    
    
    switch (dateType) {
        case kDate_Years:
            return [NSString stringWithFormat:@"%ld",year];
            break;
        case kDate_Month:
            return [NSString stringWithFormat:@"%ld",month];
            break;
        case kDate_Day:
            return [NSString stringWithFormat:@"%ld",day];
            break;
        case kDate_H:
            return [NSString stringWithFormat:@"%ld",hour];
            break;
        case kDate_M:
            return [NSString stringWithFormat:@"%ld",minute];
            break;
        case kDate_S:
            return [NSString stringWithFormat:@"%ld",second];
            break;
        case kDate_Week:
            return [weekdays objectAtIndex:dateComponent.weekday];
            break;
        default:
            break;
    }
}


+ (NSString*)getDateYYYYMMddWithSinceNow:(NSInteger)day{
    NSInteger dis = day; //前后的天数
    
    NSDate*nowDate = [NSDate date];
    NSDate* theDate;
    
    if(dis!=0)
    {
        NSTimeInterval  oneDay = 24*60*60*1;  //1天的长度
        
        theDate = [nowDate initWithTimeIntervalSinceNow: +oneDay*dis ];
        //or
        //        theDate = [nowDate initWithTimeIntervalSinceNow: -oneDay*dis ];
    }
    else
    {
        theDate = nowDate;
    }
    
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYYMMdd"];
    
    NSString *locationString=[dateformatter stringFromDate:theDate];
    return locationString;
}
@end
