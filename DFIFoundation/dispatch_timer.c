//
//  dispatch_timer.c
//  DFInfrastructure
//
//  Created by SDH on 8/19/15.
//  Copyright (c) 2015 com.dazhongcun. All rights reserved.
//

#include "dispatch_timer.h"

dispatch_timer_t create_dispatch_timer(long time_interval,
                                       long delay_interval,
                                       dispatch_block_t block) {
    
    dispatch_queue_t queue = dispatch_queue_create("DFIFoundation.timerQueue",
                                                   DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_timer_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER,
                                                    0, 0,
                                                    queue);
    
    if (timer) {
        
        dispatch_source_set_timer(timer,
                                  delay_interval * NSEC_PER_SEC,
                                  time_interval * NSEC_PER_SEC, 0);
        
        dispatch_source_set_event_handler(timer, block);
    }
    
    return timer;
}