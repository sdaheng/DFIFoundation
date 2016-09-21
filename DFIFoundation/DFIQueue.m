//
//  DQueue.m
//  ChildrenSafety
//
//  Created by SDH on 14-9-17.
//  Copyright (c) 2014年 SDH. All rights reserved.
//

#import "DFIQueue.h"

#import <pthread.h>

@interface DFIQueue ()

@property (nonatomic, strong) NSMutableArray *queue;

@end

@implementation DFIQueue

static pthread_mutex_t mutext_t = PTHREAD_MUTEX_INITIALIZER;

+ (instancetype)queue {
    return [[DFIQueue alloc] initWithCapacity:0];
}

+ (instancetype)queueWithCapacity:(NSUInteger)capacity {
    return [[self alloc] initWithCapacity:capacity];
}

- (instancetype)initWithCapacity:(NSUInteger)capacity {
    self = [super init];
    if (self) {
        _queue = [NSMutableArray arrayWithCapacity:capacity];
    }
    return self;
}

- (instancetype)init {
    return nil;
}

+ (instancetype)new {
    return nil;
}

- (void)enqueue:(const id)item {

    pthread_mutex_lock(&mutext_t);
    
    [self.queue addObject:item];

    pthread_mutex_unlock(&mutext_t);
}

- (void)dequeue {
    pthread_mutex_lock(&mutext_t);
    
    if (!self.isEmpty) {
        [self.queue removeObjectAtIndex:0];
    }
    
    pthread_mutex_unlock(&mutext_t);
}

- (id)front {
    return [self.queue firstObject];
}

- (id)rear {
    return [self.queue lastObject];
}

- (NSUInteger)count {
    return self.queue.count;
}

- (BOOL)isEmpty {
    return self.count == 0;
}

@end
