//
//  DFIExceptionHandler.h
//  DFInfrastructure
//
//  Created by SDH on 6/1/15.
//  Copyright (c) 2015 com.dazhongcun. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DFIExceptionHandlerInterface <NSObject>

- (void)handleException:(NSException *)exception;

@end

@interface DFIExceptionHandler : NSObject

+ (void)handleExceptionWithHandlerName:(NSString *)handlerName
                             exception:(NSException *)exception;

@end
