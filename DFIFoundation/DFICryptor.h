//
//  DFICryptor.h
//  DFInfrastructure
//
//  Created by SDH on 1/24/15.
//  Copyright (c) 2015 com.dazhongcun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DFICryptor : NSObject

@end

@interface DFICryptor (Digiest)

+ (NSString *)MD5ForString:(NSString *)sourceString;
+ (NSString *)MD5ForData:(NSData *)sourceData;

+ (NSString *)SHA1ForString:(NSString *)sourceString;
+ (NSString *)SHA1ForData:(NSData *)sourceData;

@end

@interface DFICryptor (AES)

- (NSData *)AESEncryptForData:(NSData *)sourceData
                      withKey:(id)key
                        error:(NSError **)error;

- (NSString *)AESEncryptForString:(NSString *)sourceString
                          withKey:(id)key
                            error:(NSError **)error;
@end
