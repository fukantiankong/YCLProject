//
//  YCLCarNewsViewModel.h
//  YCLProject
//
//  Created by 杨承龙 on 16/7/17.
//  Copyright © 2016年 Albert. All rights reserved.
//

#import "YCLBaseViewModel.h"
#import "YCLBaseViewModel.h"
#import "YCLNetManager.h"

@interface YCLCarNewsViewModel : YCLBaseViewModel
//必须使用此方法初始化, 传入当前VM请求的数据的类型
- (instancetype)initWithNewsListType:(NewsListType)type;
@property (nonatomic, readonly)  NewsListType newsListType;
@property (nonatomic, readonly)  NSString *lastTime;

@property (nonatomic, readonly)  NSInteger rowNumber;
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)timeForRow:(NSInteger)row;
- (NSString *)replyCountForRow:(NSInteger)row;
- (CarNewsResultNewslistModel *)modelForRow:(NSInteger)row;
- (NSURL *)detailURLForRow:(NSInteger)row;

//头部滚动视图
- (NSURL *)iconURLForHeaderAtIndex:(NSInteger)index;
@property (nonatomic)  NSInteger headerNumber;
@property (nonatomic, strong)  NSArray<CarNewsResultFocusimgModel *> *focusList;

@property (nonatomic, strong)  NSMutableArray<CarNewsResultNewslistModel *> *dataList;
@property (nonatomic)  NSInteger page;
//有更多页
@property (nonatomic)  BOOL isLoadMore;


@end
