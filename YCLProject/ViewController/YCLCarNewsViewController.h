//
//  YCLCarNewsViewController.h
//  YCLProject
//
//  Created by 杨承龙 on 16/7/17.
//  Copyright © 2016年 Albert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCLCarNewsViewModel.h"

@interface YCLCarNewsViewController : UITableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style newsListType:(NewsListType)type;
@property (nonatomic, readonly)  NewsListType newsListType;

@end
