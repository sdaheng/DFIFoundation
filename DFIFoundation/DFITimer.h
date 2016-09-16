//
//  DFITimer.h
//  DFInfrastructure
//
//  Created by SDH on 8/19/15.
//  Copyright (c) 2015 com.dazhongcun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DFITimerTypes.h"

@interface DFITimer : NSObject

- (void)startTimerWithSeconds:(NSInteger)seconds
                       repeat:(BOOL)repeat
                   timerBlock:(timerBlock)timerBlock
                    stopBlock:(timerStopBlock)stopblock;

- (void)startTimerWithSeconds:(NSInteger)seconds
                 afterSeconds:(NSInteger)afterSeconds
                       repeat:(BOOL)repeat
                   timerBlock:(timerBlock)timerBlock
                    stopBlock:(timerStopBlock)stopblock;

- (void)stopTimer;

@end
