//
//  DFIUnitConvert.m
//  DFInfrastructure
//
//  Created by SDH on 4/6/15.
//  Copyright (c) 2015 com.dazhongcun. All rights reserved.
//

#import "DFIUnitConvert.h"

#import <math.h>

#define CONST_1_1024 0.0009765625 // value of 1/1024.0f
#define CONST_1024   1024.0

@implementation DFIUnitConvert

@end

@implementation DFIUnitConvert (dataSize)

+ (double)convertDataSize:(double)dataSize
                 fromUnit:(DFIUnitConvertDataSizeUnit)fromUnit
                   toUnit:(DFIUnitConvertDataSizeUnit)toUnit {
    
    if (fromUnit == toUnit) {
        return dataSize;
    }
    
    BOOL convertToBigger = toUnit > fromUnit;
    
    NSInteger mutipleOfUnit = convertToBigger ? (toUnit - fromUnit) : (fromUnit - toUnit);
    
    double convertedDataSize = dataSize * powl(convertToBigger ? CONST_1_1024 : CONST_1024,
                                               mutipleOfUnit);

    return convertedDataSize;
}

@end

@implementation DFIUnitConvert (length)

@end

@implementation DFIUnitConvert (size)

@end

@implementation DFIUnitConvert (volume)

@end

@implementation DFIUnitConvert (speed)

@end

@implementation DFIUnitConvert (time)

@end
