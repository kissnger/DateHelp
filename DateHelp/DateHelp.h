//
//  DateHelp.h
//  DateHelp
//
//  Created by massimo on 15/3/1.
//  Copyright (c) 2015年 massimo. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum: NSUInteger{
    kDate_Week,
    kDate_Years,
    kDate_Month,
    kDate_Day,
    kDate_H,
    kDate_M,
    kDate_S,
}DateType;
@interface DateHelp : NSObject
+ (NSString*)getDateYYYYMMddWithSinceNow:(NSInteger)day;
+ (NSString*)getDate:(DateType)dateType andSinceNow:(NSInteger)dayNum;
@end
