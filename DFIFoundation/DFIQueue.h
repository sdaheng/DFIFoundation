//
//  DQueue.h
//  ChildrenSafety
//
//  Created by SDH on 14-9-17.
//  Copyright (c) 2014年 SDH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DFIQueue : NSObject

+ (instancetype)queue;
+ (instancetype)queueWithCapacity:(NSUInteger)capacity;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new  NS_UNAVAILABLE;

- (id)front;
- (id)rear;

- (void)enqueue:(id)item;
- (void)dequeue;

- (BOOL)isEmpty;

- (NSUInteger)count;

@end
