//
//  DFIFileOperationManager.m
//  DFInfrastructure
//
//  Created by SDH on 15/1/23.
//  Copyright (c) 2015年 com.dazhongcun. All rights reserved.
//

#import "DFIFileOperationManager.h"
#import "DFIFoundationDefines.h"

#import <sys/stat.h>

@interface DFIFileOperationManager ()

@end

@implementation DFIFileOperationManager

+ (NSString *)appDocumentDirectoryString {
 
    return [[self appDocumentDirectoryURL] path];
}

+ (NSURL *)appDocumentDirectoryURL {
    
    return [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
                                                  inDomain:NSUserDomainMask
                                         appropriateForURL:nil
                                                    create:YES
                                                     error:NULL];
}

+ (BOOL)fileExistAtPath:(NSString *)filePath {
    return [[NSFileManager defaultManager] fileExistsAtPath:filePath];
}

+ (NSString *)filePathAtDocumentDirectory:(NSString *)fileNameString {
    return [[self filePathURLAtDocumentDirectory:fileNameString] path];
}

+ (NSURL *)filePathURLAtDocumentDirectory:(NSString *)fileNameString {
    return [[self appDocumentDirectoryURL] URLByAppendingPathComponent:fileNameString];
}

+ (void)removeFileAtPath:(NSString *)filePath
                   error:(NSError **)error {
    
    [[NSFileManager defaultManager] removeItemAtPath:filePath
                                               error:error];
}

+ (off_t)sizeOfFileAtPath:(NSString *)filePath {
    struct stat file_stat;

    if (stat([filePath UTF8String], &file_stat) == 0) {
        return file_stat.st_size;
    }
    
    return 0;
}

+ (void)readContentsOfFileAsynchronously:(NSURL *)filePathURL
                              completion:(void(^)(NSData *data, NSError *error))completion {
    
    if (!filePathURL) {
        return;
    }
    dispatch_queue_t readQueue = dispatch_queue_create("com.DFIFoundation.fileOperationManager",
                                                       DISPATCH_QUEUE_SERIAL);
    
    dispatch_io_t ioChannel =
    dispatch_io_create_with_path(DISPATCH_IO_STREAM, [[filePathURL path] UTF8String], O_RDONLY, 0,
                                 readQueue, ^(int error) {});
    
    if (!ioChannel) {
        completion ? completion(nil, DFIError(@"File Error", 0, @"")) : nil;
        return;
    }
    
    NSInteger fileSize = [self sizeOfFileAtPath:[filePathURL path]];

    NSMutableData *mutableData = [NSMutableData dataWithCapacity:fileSize];
    dispatch_io_read(ioChannel, 0, SIZE_MAX, readQueue, ^(bool done,
                                                          dispatch_data_t _Nullable data,
                                                          int error) {
        if (error) {
            completion ? completion(nil, DFIError(@"File Error",
                                                  error,
                                                  [NSString stringWithCString:strerror(error)
                                                                     encoding:NSUTF8StringEncoding])) : nil;
            return;
        }

        dispatch_data_apply(data, ^bool(dispatch_data_t  _Nonnull region, size_t offset,
                                        const void * _Nonnull buffer, size_t size) {
            [mutableData appendData:[NSData dataWithBytes:buffer
                                                   length:size]];
            return true;
        });
        
        if (done && data == dispatch_data_empty && error == 0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion([mutableData copy], nil);
                }
                dispatch_io_close(ioChannel, DISPATCH_IO_STOP);
            });
        } else if (error != 0) {
            if (completion) {
                completion(nil, DFIError(@"File Error",
                                         error,
                                         [NSString stringWithCString:strerror(error)
                                                            encoding:NSUTF8StringEncoding]));
            }
            dispatch_io_close(ioChannel, DISPATCH_IO_STOP);
        }
    });
} 

+ (void)writeDataToFileAsynchronously:(NSData *)data
                             filePath:(NSURL *)filePathURL
                           completion:(void(^)(BOOL exist, NSError *error))compltion {
 
    if (!filePathURL) {
        return;
    }
    dispatch_queue_t writeQueue = dispatch_queue_create("com.DFIFoundation.writeQueue", NULL);
    
    dispatch_io_t io_t = dispatch_io_create_with_path(DISPATCH_IO_STREAM,
                                                      [[filePathURL path] UTF8String],
                                                      O_WRONLY | O_CREAT, 0, writeQueue, ^(int error) {
        
                                                      });
    
    if (!io_t) {
        compltion ? compltion(NO, [NSError errorWithDomain:@"File Error"
                                                      code:0
                                                  userInfo:@{}]) : nil;
        return;
    }
    dispatch_io_write(io_t, 0, dispatch_data_create(data.bytes, data.length, NULL, NULL), writeQueue, ^(bool done, dispatch_data_t  _Nullable data, int error) {
        if (done && error == 0) {
            chmod([[filePathURL path] UTF8String], S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
            
            compltion ? compltion([self fileExistAtPath:[filePathURL path]], nil) : nil;
            
            dispatch_io_close(io_t, DISPATCH_IO_STOP);
        } else if (error != 0) {
            compltion ? compltion([self fileExistAtPath:[filePathURL path]],
                                  DFIError(@"File Error",
                                           error,
                                           [NSString stringWithCString:strerror(error)
                                                              encoding:NSUTF8StringEncoding])) : nil;
            dispatch_io_close(io_t, DISPATCH_IO_STOP);
        }
    });
}

@end
