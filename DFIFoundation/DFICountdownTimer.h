//
//  DFICountDownTimer.h
//  ReserveByCharming
//
//  Created by SDH on 6/24/15.
//  Copyright (c) 2015 com.dazhongcun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DFITimerTypes.h"

@interface DFICountdownTimer : NSObject

@property (nonatomic, readonly) NSInteger remainingSeconds;

- (void)startSecondsCountdownTimerWithSeconds:(NSInteger)seconds
                                  timerBlock:(timerBlock)block
                              timerStopBlock:(timerStopBlock)stopBlock;

- (void)startDateCountdownTimerWithStartDate:(NSDate *)startDate
                                  andEndDate:(NSDate *)endDate
                                calendarUnit:(NSCalendarUnit)calendarUnit
                                   withBlock:(dateTimerBlock)block
                              timerStopBlock:(timerStopBlock)stopBlock;

- (void)stopTimer;

@end
