//
//  DFITimer.m
//  DFInfrastructure
//
//  Created by SDH on 8/19/15.
//  Copyright (c) 2015 com.dazhongcun. All rights reserved.
//

#import "DFITimer.h"

#import "dispatch_timer.h"

@interface DFITimer ()

@property (nonatomic, strong) dispatch_timer_t timer;
@property (nonatomic, assign) NSInteger remainingSeconds;

@end

@implementation DFITimer

- (void)startTimerWithSeconds:(NSInteger)seconds
                 afterSeconds:(NSInteger)afterSeconds
                       repeat:(BOOL)repeat
                   timerBlock:(timerBlock)timerBlock
                    stopBlock:(timerStopBlock)stopblock {

    if (self.timer) {
        [self stopTimer];
    }
    
    self.timer = create_dispatch_timer(seconds,
                                       afterSeconds, ^{
       self.remainingSeconds ++;
       
       dispatch_async(dispatch_get_main_queue(), ^{
           if (timerBlock) {
               timerBlock(self.remainingSeconds);
           }
           
           if (!repeat) {
               [self stopTimer];
               
               if (stopblock) {
                   stopblock();
               }
           }
       });
   });
    
    dispatch_resume(self.timer);
}

- (void)startTimerWithSeconds:(NSInteger)seconds
                       repeat:(BOOL)repeat
                   timerBlock:(timerBlock)timerBlock
                    stopBlock:(timerStopBlock)stopblock {
    
    [self startTimerWithSeconds:seconds
                   afterSeconds:0
                         repeat:repeat
                     timerBlock:timerBlock
                      stopBlock:stopblock];
}

- (void)stopTimer {
    if (self.timer) {
        dispatch_source_cancel(self.timer);
        self.timer = nil;
    }
}

@end
