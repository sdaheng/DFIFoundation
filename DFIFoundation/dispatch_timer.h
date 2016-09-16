//
//  dispatch_timer.h
//  DFInfrastructure
//
//  Created by SDH on 8/19/15.
//  Copyright (c) 2015 com.dazhongcun. All rights reserved.
//

#ifndef __DFInfrastructure__dispatch_timer__
#define __DFInfrastructure__dispatch_timer__

#include "DFIFoundationDefines.h"
#include <dispatch/dispatch.h>

typedef dispatch_source_t dispatch_timer_t;

DFI_EXPORT dispatch_timer_t create_dispatch_timer(long time_interval,
                                                  long delay_interval,
                                                  dispatch_block_t block);

#endif
