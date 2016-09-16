//
//  NSString+Check.m
//  dzc_personal_ios
//
//  Created by SDH on 14-8-1.
//  Copyright (c) 2014年 DZC. All rights reserved.
//

#import "NSString+check.h"

@implementation NSString (check)

- (BOOL)isEmpty {
    return (self.length == 0);
}

- (BOOL)isCorrectPassword {
    return [self length] >= 6;
}

- (BOOL)isMobilePhoneNumber {
    if ([self isEmpty] || [self length] != 11) {
        return NO;
    }
    
    NSString *mobilePhoneNumberRegex =
    @"^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$";
    
    NSError *error = nil;
    
    NSRegularExpression *regularExpression =
    [NSRegularExpression regularExpressionWithPattern:mobilePhoneNumberRegex
                                              options:NSRegularExpressionDotMatchesLineSeparators
                                                error:&error];
    
    if (!error) {
        NSArray *matchArray =  [regularExpression matchesInString:self
                                                          options:NSMatchingReportCompletion
                                                            range:NSMakeRange(0, [self length])];
        return [matchArray count] == 1;
    } else {
        return NO;
    }
}

- (BOOL)isEmail {
    return [self rangeOfString:@"@"].location != NSNotFound;
}

@end
