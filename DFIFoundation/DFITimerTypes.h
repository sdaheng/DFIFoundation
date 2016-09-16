//
//  DFITimerTypes.h
//  DFInfrastructure
//
//  Created by SDH on 8/19/15.
//  Copyright (c) 2015 com.dazhongcun. All rights reserved.
//

#ifndef DFInfrastructure_DFITimerTypes_h
#define DFInfrastructure_DFITimerTypes_h

typedef void(^timerBlock)(NSInteger remainingSeconds);
typedef void(^dateTimerBlock)(NSString *countdownTimeString);
typedef void(^timerStopBlock)();

#endif
