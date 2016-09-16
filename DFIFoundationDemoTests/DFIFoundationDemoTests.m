//
//  DFIFoundationDemoTests.m
//  DFIFoundationDemoTests
//
//  Created by sdaheng on 16/9/16.
//  Copyright © 2016年 sdaheng. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "DFIFoundation.h"

@interface DFIFoundationDemoTests : XCTestCase

@end

@implementation DFIFoundationDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)testStringIsEmpty {
    NSString *emptyString = nil;
    
    XCTAssertFalse([emptyString isEmpty]);
    
    emptyString = @"";
    
    XCTAssertTrue([emptyString isEmpty]);
    
    emptyString = @"123";
    
    XCTAssertFalse([emptyString isEmpty]);
}

- (void)testIsCorrectPassword {
    XCTAssertFalse([@"" isCorrectPassword]);
    XCTAssertFalse([@"1" isCorrectPassword]);
    XCTAssertTrue([@"1111111" isCorrectPassword]);
}

- (void)testIsMobileNumber {
    XCTAssertFalse([@"" isMobilePhoneNumber]);
    XCTAssertFalse([@"12311221211" isMobilePhoneNumber]);
    XCTAssertTrue([@"13244323324" isMobilePhoneNumber]);
}

- (void)testDataSizeConvert {
    XCTAssertEqual([DFIUnitConvert convertDataSize:1
                                          fromUnit:DFIUnitConvertDataSizeMegaByteUnit
                                            toUnit:DFIUnitConvertDataSizeKiloByteUnit], 1024);
    
    XCTAssertEqual([DFIUnitConvert convertDataSize:1024
                                          fromUnit:DFIUnitConvertDataSizeKiloByteUnit
                                            toUnit:DFIUnitConvertDataSizeMegaByteUnit], 1);
    
    XCTAssertEqual([DFIUnitConvert convertDataSize:1024
                                          fromUnit:DFIUnitConvertDataSizeByteUnit
                                            toUnit:DFIUnitConvertDataSizeMegaByteUnit], 1 / 1024.0);
}

- (void)testQueue {
    DFIQueue *queue = [DFIQueue queue];
    
    [queue enqueue:@(1)];
    [queue enqueue:@(2)];
    [queue enqueue:@(3)];
    
    XCTAssertEqual(queue.count, 3);
    
    XCTAssertEqualObjects([queue front], @(1));
    XCTAssertEqualObjects([queue rear], @(3));
    
    [queue dequeue];
    
    XCTAssertEqualObjects([queue front], @(2));
    
    [queue dequeue];
    
    XCTAssertEqualObjects([queue front], @(3));
    XCTAssertEqualObjects([queue rear], @(3));
    
    [queue dequeue];
    
    XCTAssertTrue([queue isEmpty]);
    
    [queue dequeue];
    
    [queue enqueue:@(1)];
    
    XCTAssertEqualObjects([queue front], @(1));
    XCTAssertEqualObjects([queue rear], @(1));
}

- (void)testStack {
    DFIStack *stack = [DFIStack stack];
    
    [stack push:@(1)];
    [stack push:@(2)];
    [stack push:@(3)];
    
    XCTAssertEqual(stack.count, 3);
    
    XCTAssertEqualObjects([stack top], @(3));
    
    [stack pop];
    
    XCTAssertEqualObjects([stack top], @(2));
    
    [stack pop];
    
    XCTAssertEqualObjects([stack top], @(1));
    
    [stack pop];
    
    XCTAssertTrue([stack isEmpty]);
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.

    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
