//
//  AppDelegate.m
//  YCLProject
//
//  Created by 杨承龙 on 16/7/15.
//  Copyright © 2016年 Albert. All rights reserved.
//

#import "AppDelegate.h"
#import "YCLNetManager.h"
#import "YCLPageViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    [self setupGlobalConfig];
    
    YCLPageViewController *vc = [[YCLPageViewController alloc] init];
    vc.showOnNavigationBar = YES;
    vc.menuViewStyle = WMMenuViewStyleLine;
    vc.menuBGColor = [UIColor clearColor];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = navigationController;
    
    return YES;
}


@end
