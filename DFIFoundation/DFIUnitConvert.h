//
//  DFIUnitConvert.h
//  DFInfrastructure
//
//  Created by SDH on 4/6/15.
//  Copyright (c) 2015 com.dazhongcun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DFIUnitConvert : NSObject

@end

typedef enum : NSInteger {
    DFIUnitConvertDataSizeByteUnit,
    DFIUnitConvertDataSizeKiloByteUnit,
    DFIUnitConvertDataSizeMegaByteUnit,
    DFIUnitConvertDataSizeGigaByteUnit,
    DFIUnitConvertDataSizeTeraByteUnit,
    DFIUnitConvertDataSizePetaByteUnit
} DFIUnitConvertDataSizeUnit;

@interface DFIUnitConvert (dataSize)

+ (double)convertDataSize:(double)dataSize
                 fromUnit:(DFIUnitConvertDataSizeUnit)fromUnit
                   toUnit:(DFIUnitConvertDataSizeUnit)toUnit;
@end

@interface DFIUnitConvert (length)

@end

@interface DFIUnitConvert (size)

@end

@interface DFIUnitConvert (volume)

@end

@interface DFIUnitConvert (speed)

@end
