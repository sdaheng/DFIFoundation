//
//  DFIStack.h
//  DFInfrastructure
//
//  Created by sdaheng on 16/9/14.
//  Copyright © 2016年 com.dazhongcun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DFIStack : NSObject

+ (instancetype)stack;
+ (instancetype)stackWithCapacity:(NSUInteger)capacity;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new  NS_UNAVAILABLE;

- (id)top;
- (void)push:(id)item;
- (void)pop;
- (BOOL)isEmpty;
- (NSUInteger)count;

@end
