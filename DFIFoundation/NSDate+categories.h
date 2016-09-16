//
//  NSDate+formatDate.h
//  MMY_Merchant
//
//  Created by SDH on 7/10/15.
//  Copyright (c) 2015 dazhongcun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (formatDate)

- (NSString *)formatDateWithFormat:(NSString *)format;

+ (NSDate *)convertDateFromString:(NSString *)dateString
                 withOriginFormat:(NSString *)originformat
                     andEndFormat:(NSString *)endFormat;
@end

@interface NSDate (WeekDay)

- (NSString *)weekDay;

@end