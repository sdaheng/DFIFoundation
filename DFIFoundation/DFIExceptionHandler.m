//
//  DFIExceptionHandler.m
//  DFInfrastructure
//
//  Created by SDH on 6/1/15.
//  Copyright (c) 2015 com.dazhongcun. All rights reserved.
//

#import "DFIExceptionHandler.h"

@implementation DFIExceptionHandler

+ (void)handleExceptionWithHandlerName:(NSString *)handlerName
                             exception:(NSException *)exception {
    
    if ([handlerName isKindOfClass:[NSString class]]) {
        id<DFIExceptionHandlerInterface> interface = [[NSClassFromString(handlerName) alloc] init];
        
        if (interface &&
            [interface respondsToSelector:@selector(handleExceptionWithHandlerName:exception:)]) {
            [interface handleException:exception];
        }
    }
}

@end
