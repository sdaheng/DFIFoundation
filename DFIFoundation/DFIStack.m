//
//  DFIStack.m
//  DFInfrastructure
//
//  Created by sdaheng on 16/9/14.
//  Copyright © 2016年 com.dazhongcun. All rights reserved.
//

#import "DFIStack.h"

#import <pthread.h>

@interface DFIStack ()

@property (nonatomic, strong) NSMutableArray *stack;

@end

@implementation DFIStack

static pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;

+ (instancetype)stack {
    return [[self alloc] initWithCapacity:0];
}

+ (instancetype)stackWithCapacity:(NSUInteger)capacity {
    return [[self alloc] initWithCapacity:capacity];
}

- (instancetype)initWithCapacity:(NSUInteger)capacity {
    self = [super init];
    if (self) {
        _stack = [NSMutableArray arrayWithCapacity:capacity];
    }
    return self;
}

- (instancetype)init {
    return nil;
}

+ (instancetype)new {
    return nil;
}

- (id)top {
    return [self.stack lastObject];
}

- (void)push:(id)item {
    pthread_mutex_lock(&lock);
    
    [self.stack addObject:item];
    
    pthread_mutex_unlock(&lock);
}

- (void)pop {
    pthread_mutex_lock(&lock);
    
    if (self.isEmpty) {
        pthread_mutex_unlock(&lock);
        return;
    }
    
    [self.stack removeLastObject];
    
    pthread_mutex_unlock(&lock);
}

- (NSUInteger)count {
    return self.stack.count;
}

- (BOOL)isEmpty {
    return self.stack.count == 0;
}

@end
