//
//  DFICountDownTimer.m
//  ReserveByCharming
//
//  Created by SDH on 6/24/15.
//  Copyright (c) 2015 com.dazhongcun. All rights reserved.
//

#import "DFICountdownTimer.h"
#import "dispatch_timer.h"

@interface DFICountdownTimer ()

@property (nonatomic, strong) dispatch_timer_t timer;

@property (nonatomic, strong) NSCalendar *calendar;

@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, strong) NSDate *stopDate;
@property (nonatomic, assign) NSInteger seconds;

@end

@implementation DFICountdownTimer

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _calendar = [NSCalendar currentCalendar];
    }
    
    return self;
}

- (void)startSecondsCountdownTimerWithSeconds:(NSInteger)seconds
                                  timerBlock:(timerBlock)block
                              timerStopBlock:(timerStopBlock)stopBlock{
    
    self.seconds = seconds;
    
    if (self.timer) {
        [self stopTimer];
    }
    
    self.timer = create_dispatch_timer(1, 0, ^{
        self.remainingSeconds --;
        
        dispatch_async(dispatch_get_main_queue(), ^{
                           if (block) {
                               block(self.remainingSeconds);
                           }
                       });
        
        if (self.remainingSeconds <= 0) {
            [self stopTimer];
            
            self.remainingSeconds = self.seconds;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (stopBlock) {
                    stopBlock();
                }
            });
        }
    });
    
    dispatch_resume(self.timer);
}

- (void)startDateCountdownTimerWithStartDate:(NSDate *)startDate
                                  andEndDate:(NSDate *)endDate
                                calendarUnit:(NSCalendarUnit)calendarUnit
                                   withBlock:(dateTimerBlock)block
                              timerStopBlock:(timerStopBlock)stopBlock {
    
    self.startDate = startDate;
    self.stopDate  = endDate;
    
    if (self.timer) {
        [self stopTimer];
    }
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    __block NSDate *date = startDate;
    
    self.timer = create_dispatch_timer(1, 0, ^{
        date = [NSDate dateWithTimeInterval:1
                                  sinceDate:date];
        
        NSDateComponents *dateComponents = [calendar components:calendarUnit
                                                       fromDate:date
                                                         toDate:endDate
                                                        options:0];
        
        if (dateComponents.second < 0 &&
            dateComponents.minute <= 0 &&
            dateComponents.hour <= 0) {
            [self stopTimer];
            self.startDate = nil;
            self.stopDate  = nil;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (stopBlock) {
                    stopBlock();
                }
            });
        }else {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSMutableString *remainingDateString = [NSMutableString string];
                
                if ((calendarUnit & NSCalendarUnitYear) == 0) {
                    [remainingDateString appendFormat:@"%ld", (long)dateComponents.year];
                }
                
                if ((calendarUnit & NSCalendarUnitMonth) == 0) {
                    [remainingDateString appendFormat:@"%02ld", dateComponents.month];
                }
                
                if ((calendarUnit & NSCalendarUnitDay) == 0) {
                    [remainingDateString appendFormat:@"%02ld", dateComponents.day];
                }
                
                if ((calendarUnit & NSCalendarUnitHour) == 0) {
                    [remainingDateString appendFormat:@"%02ld", dateComponents.hour];
                }
                
                if ((calendarUnit & NSCalendarUnitMinute) == 0) {
                    [remainingDateString appendFormat:@"%02ld", dateComponents.minute];
                }
                
                if ((calendarUnit & NSCalendarUnitMinute) == 0) {
                    [remainingDateString appendFormat:@"%02ld", dateComponents.second];
                }
                
                if (block) {
                    block([remainingDateString copy]);
                }
            });
        }
    });
    
    dispatch_resume(self.timer);
}

- (void)stopTimer {
    if (self.timer) {
        dispatch_source_cancel(self.timer);
        self.timer = nil;
    }
}

- (void)setRemainingSeconds:(NSInteger)seconds {
    _remainingSeconds = seconds;
}

- (void)setSeconds:(NSInteger)seconds {
    _seconds = seconds;
    _remainingSeconds = seconds;
}

@end

