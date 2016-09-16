//
//  DFIEncryptor.m
//  DFInfrastructure
//
//  Created by SDH on 1/24/15.
//  Copyright (c) 2015 com.dazhongcun. All rights reserved.
//

#import "DFICryptor.h"
#import <CommonCrypto/CommonCrypto.h>
#import <Security/Security.h>
#import "NSData+CommonCrypto.h"

@interface DFICryptor ()

@end

@implementation DFICryptor

@end

@implementation DFICryptor (Digiest)

+ (NSString *)MD5ForString:(NSString *)sourceString {
    
    NSData *stringData = [sourceString dataUsingEncoding:NSUTF8StringEncoding];
    
    return [self MD5ForData:stringData];
}

+ (NSString *)MD5ForData:(NSData *)sourceData {
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    if (sourceData && sourceData.bytes && sourceData.length > 0) {
        CC_MD5([sourceData bytes],
               (CC_LONG)[sourceData length],
               result);
        
        NSMutableString *MD5String = [NSMutableString string];
        
        for(int index = 0; index < CC_MD5_DIGEST_LENGTH; index ++) {
            [MD5String appendFormat:@"%02x", result[index]];
        }
        
        return [MD5String copy];
    }
    
    return nil;
}

+ (NSString *)SHA1ForString:(NSString *)sourceString {
    
    NSData *stringData = [sourceString dataUsingEncoding:NSUTF8StringEncoding];
    
    return [self SHA1ForData:stringData];
}

+ (NSString *)SHA1ForData:(NSData *)sourceData {
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    
    if (sourceData && sourceData.bytes && sourceData.length > 0) {
        CC_SHA1(sourceData.bytes,
                (CC_LONG)sourceData.length,
                result);
        
        NSMutableString *SHA1String = [NSMutableString string];
        
        for(int index = 0; index < CC_SHA1_DIGEST_LENGTH; index ++) {
            [SHA1String appendFormat:@"%02x", result[index]];
        }
        
        return [SHA1String copy];
    }
    
    return nil;
}

@end

@implementation DFICryptor (AES)

- (NSData *)AESEncryptForData:(NSData *)sourceData
                      withKey:(id)key
                        error:(NSError **)error {
    
    return [sourceData AES256EncryptedDataUsingKey:key
                                             error:error];
}

- (NSString *)AESEncryptForString:(NSString *)sourceString
                          withKey:(id)key
                            error:(NSError **)error {
    
    return [[NSString alloc] initWithData:[self AESEncryptForData:[sourceString dataUsingEncoding:NSUTF8StringEncoding]
                                                          withKey:key
                                                            error:error]
                                 encoding:NSUTF8StringEncoding];
}

@end
