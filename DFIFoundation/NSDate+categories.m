//
//  NSDate+formatDate.m
//  MMY_Merchant
//
//  Created by SDH on 7/10/15.
//  Copyright (c) 2015 dazhongcun. All rights reserved.
//

#import "NSDate+categories.h"

@implementation NSDate (formatDate)

- (NSString *)formatDateWithFormat:(NSString *)format {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:format];
    
    return [dateFormatter stringFromDate:self];
}

+ (NSDate *)convertDateFromString:(NSString *)dateString
                 withOriginFormat:(NSString *)originFormat
                     andEndFormat:(NSString *)endFormat {
    
    NSDateFormatter *originDateFormatter = [[NSDateFormatter alloc] init];
    
    [originDateFormatter setDateFormat:originFormat];
    
    NSDate *originFormatDate = [originDateFormatter dateFromString:dateString];
    
    NSDateFormatter *endDateFormatter = [[NSDateFormatter alloc] init];
    
    [endDateFormatter setDateFormat:endFormat];
    
    return [endDateFormatter dateFromString:[endDateFormatter stringFromDate:originFormatDate]];
}

@end

@implementation NSDate (WeekDay)

- (NSString *)weekDay {
   
    NSDateComponents *dateComponent = [[NSCalendar currentCalendar]
                                       components:NSCalendarUnitWeekday fromDate:self];
    
    //should be localized
    NSArray *weekDaysArray = @[@"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六"];
    
    return weekDaysArray[dateComponent.weekday - 1];
}

@end
