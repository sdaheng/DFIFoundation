//
//  DFIFileOperationManager.h
//  DFInfrastructure
//
//  Created by SDH on 15/1/23.
//  Copyright (c) 2015年 com.dazhongcun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DFIFileOperationManager : NSObject

+ (NSString *)appDocumentDirectoryString;

+ (NSURL *)appDocumentDirectoryURL;

+ (NSString *)filePathAtDocumentDirectory:(NSString *)fileNameString;
+ (NSURL *)filePathURLAtDocumentDirectory:(NSString *)fileNameString;

+ (BOOL)fileExistAtPath:(NSString *)filePath;

+ (void)removeFileAtPath:(NSString *)filePath
                   error:(NSError **)error;

+ (off_t)sizeOfFileAtPath:(NSString *)filePath;

+ (void)readContentsOfFileAsynchronously:(NSURL *)filePathURL
                              completion:(void(^)(NSData *data, NSError *error))completion;

+ (void)writeDataToFileAsynchronously:(NSData *)data
                             filePath:(NSURL *)filePathURL
                           completion:(void(^)(BOOL exist, NSError *error))compltion;

@end
