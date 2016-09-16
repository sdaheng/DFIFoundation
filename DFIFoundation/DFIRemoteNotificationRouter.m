//
//  DFINotificationRouter.m
//  MMYStylist
//
//  Created by SDH on 1/23/16.
//  Copyright © 2016 sdaheng. All rights reserved.
//

#import "DFIRemoteNotificationRouter.h"

#import <UIKit/UIKit.h>

NSString * const kDFIRNRStoryboardIDKey = @"storyboardID";

@interface DFIRemoteNotificationRouter ()

@property (nonatomic, strong) UIStoryboard *storyboard;

@property (nonatomic, strong) UINavigationController *navigationController;

@property (nonatomic, copy) NSDictionary *remoteNotificationRouterDictionary;

@end

@implementation DFIRemoteNotificationRouter

- (instancetype)initWithStoryboard:(UIStoryboard *)storyboard {
    return [self initWithStoryboard:storyboard
                     routerFileName:@"RemoteNotificationNamesList"
                             bundle:[NSBundle mainBundle]];
}

- (instancetype)initWithStoryboard:(UIStoryboard *)storyboard
                    routerFileName:(NSString *)routerFileName
                            bundle:(NSBundle *)bundle {
    
    self = [super init];
    
    if (self) {
        
        _storyboard = storyboard;

        [self loadRemoteNotificationRouterFileWithName:routerFileName
                                                bundle:bundle];
    }
    
    return self;
}

- (void)loadRemoteNotificationRouterFileWithName:(NSString *)routerFileNameString
                                          bundle:(NSBundle *)bundle {
    
    NSCParameterAssert(routerFileNameString);
    
    NSString *routerFilePathString = nil;
    
    if (bundle) {
        routerFilePathString =
        [bundle pathForResource:routerFileNameString ofType:@"plist"];
    } else {
        routerFilePathString = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                    NSUserDomainMask,
                                                                    NO) lastObject];
        
        routerFilePathString = [[routerFilePathString stringByAppendingString:routerFileNameString]
                                                      stringByAppendingPathExtension:@"plist"];
    }
    
    self.remoteNotificationRouterDictionary =
    [NSDictionary dictionaryWithContentsOfFile:routerFilePathString];
}

- (void)routeRemoteNotificationWithName:(NSString *)notificationName
                               userInfo:(NSDictionary *)userInfo {

    if (!notificationName) {
        return;
    }
    
    NSDictionary *routerInfoDictionary =
    self.remoteNotificationRouterDictionary[notificationName];

    NSString *storyboardIDString = routerInfoDictionary[kDFIRNRStoryboardIDKey];
    
    UIViewController *viewController =
    [self.storyboard instantiateViewControllerWithIdentifier:storyboardIDString];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    if (viewController &&
        [viewController respondsToSelector:@selector(viewModel)]) {
        
        id viewModel = [viewController performSelector:@selector(viewModel)];
        
        if ([viewModel conformsToProtocol:@protocol(DFIRemoteNotificationRouterDelegate)] &&
            [viewModel respondsToSelector:@selector(routeRemoteNotificationUserInfo:)]) {
            
            [viewModel performSelector:@selector(routeRemoteNotificationUserInfo:)
                            withObject:userInfo];
        }
    } else if (viewController &&
               [viewController conformsToProtocol:@protocol(DFIRemoteNotificationRouterDelegate)]) {
        if ([viewController respondsToSelector:@selector(routeRemoteNotificationUserInfo:)]) {
            
            [viewController performSelector:@selector(routeRemoteNotificationUserInfo:)
                                 withObject:userInfo];
        }
    } else {
        @throw [NSException exceptionWithName:@"DFInfrastructure Method Not Found Exception"
                                       reason:@"NO getter of viewModel"
                                     userInfo:nil];
    }
#pragma clang diagnostic pop
    
    UINavigationController *naviationController =
    [[UINavigationController alloc] initWithRootViewController:viewController];
    
    self.navigationController = naviationController;
    
    viewController.navigationItem.leftBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"返回"
                                     style:UIBarButtonItemStyleDone
                                    target:self
                                    action:@selector(dismissViewController:)];

    [[[[UIApplication sharedApplication] delegate] window].rootViewController
     presentViewController:self.navigationController animated:YES completion:nil];
}

- (void)dismissViewController:(UIBarButtonItem *)item {
    [self.navigationController dismissViewControllerAnimated:YES
                                                  completion:nil];
}

@end
