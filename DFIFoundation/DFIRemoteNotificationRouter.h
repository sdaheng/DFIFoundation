//
//  DFINotificationRouter.h
//  MMYStylist
//
//  Created by SDH on 1/23/16.
//  Copyright © 2016 sdaheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIStoryboard;

extern NSString * const kDFIRNRStoryboardIDKey;

@protocol DFIRemoteNotificationRouterDelegate <NSObject>

@required
/**
 *  要路由到的ViewController的ViewModel需要实现这个方法来传送推送的附带信息
 *
 *  @param userInfo 推送的附带信息
 */
- (void)routeRemoteNotificationUserInfo:(NSDictionary *)userInfo;

@end

/**
 路由远程推送通知
 在本地Bundle中新建一个名为RemoteNotificationNamesList.plist文件
 @{@"'notificationName'" : @{"storyboardID" //必须为storyboardID : @""}}
 */
@interface DFIRemoteNotificationRouter : NSObject 

/**
 *  创建远程推送通知路由, 在MainBundle中新建一个名为RemoteNotificationNamesList.plist文件
 *
 *  @param storyboard 要弹出的ViewController所在的storyboard
 *
 *  @return 路由实例
 */
- (instancetype)initWithStoryboard:(UIStoryboard *)storyboard;

/**
 *  创建远程推送通知路由
 *
 *  @param storyboard     要弹出的ViewController所在的storyboard
 *  @param routerFileName 路由文件名, 不需要加扩展名(.plist)
 *  @param bundle         路由文件所在的Bundle, 如果Bundle参数为nil, 则从Document文件夹中找
 *
 *  @return 路由实例
 */
- (instancetype)initWithStoryboard:(UIStoryboard *)storyboard
                    routerFileName:(NSString *)routerFileName
                            bundle:(NSBundle *)bundle;

/**
 *  路由远程推送通知
 *
 *  @param notificationName 推送名称
 *  @param userInfo         推送的附带信息
 */
- (void)routeRemoteNotificationWithName:(NSString *)notificationName
                               userInfo:(NSDictionary *)userInfo;

@end
