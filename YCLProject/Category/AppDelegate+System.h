//
//  AppDelegate+System.h
//  YCLProject
//
//  Created by 杨承龙 on 16/7/16.
//  Copyright © 2016年 Albert. All rights reserved.
//

#import "AppDelegate.h"
#import <AFNetworkReachabilityManager.h>
#import <AFNetworkActivityIndicatorManager.h>

@interface AppDelegate (System)
/** 当前网络是否在线: 在线: WiFi + 手机网络 */
@property (nonatomic, getter=isOnline, readonly)  BOOL online;
/** 当前网络状态:无网络, 未知, WiFi, 手机网路 */
@property (nonatomic, readonly)  AFNetworkReachabilityStatus netReachStatus;
/** 进行一些全局的配置,如:开启网络监测, 网络活动提示, 初始化 DDLog 等 */
- (void)setupGlobalConfig;


@end
