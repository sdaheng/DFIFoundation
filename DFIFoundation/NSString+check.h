//
//  NSString+Check.h
//  dzc_personal_ios
//
//  Created by SDH on 14-8-1.
//  Copyright (c) 2014年 DZC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (check)

- (BOOL)isEmpty;

- (BOOL)isMobilePhoneNumber;
- (BOOL)isCorrectPassword;

@end
