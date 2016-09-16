//
//  DFIDefines.h
//  DFInfrastructure
//
//  Created by SDH on 14/12/29.
//  Copyright (c) 2014年 com.dazhongcun. All rights reserved.
//

#ifndef DFInfrastructure_DFIDefines_h
#define DFInfrastructure_DFIDefines_h

#if __cplusplus
#define DFI_EXPORT extern "C"
#else
#define DFI_EXPORT extern
#endif

#define EXCEPTION_ONLY_DESCRIPTION_BEGIN @try {

#define EXCEPTION_ONLY_DESCRIPTION_END   }                                 \
                                         @catch (NSException *exception) { \
                                            NSLog(@"Exception: %@\nFile: %s\nMethod: %s", [exception description], __FILE__, __FUNCTION__); \
                                         }                                  \
                                         @finally {                         \
                                                                            \
                                         }

#define OPTIONAL_PARAMATER_VALUE(value) value ? : @""

#define DFIError(domain, errorCode, reason) \
        [NSError errorWithDomain:domain code:errorCode userInfo:@{@"reason" : reason}]

#endif

