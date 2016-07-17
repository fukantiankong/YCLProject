//
//  YCLDetailViewController.h
//  YCLProject
//
//  Created by 杨承龙 on 16/7/17.
//  Copyright © 2016年 Albert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCLDetailViewController : UIViewController

- (instancetype)initWithURL:(NSURL *)detailURL;
@property (nonatomic, readonly)  NSURL *detailURL;

@end
