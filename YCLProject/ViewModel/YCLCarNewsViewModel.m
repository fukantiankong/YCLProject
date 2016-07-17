
//
//  YCLCarNewsViewModel.m
//  YCLProject
//
//  Created by 杨承龙 on 16/7/17.
//  Copyright © 2016年 Albert. All rights reserved.
//

#import "YCLCarNewsViewModel.h"

@implementation YCLCarNewsViewModel

- (instancetype)initWithNewsListType:(NewsListType)type {
    if (self = [super init]) {
        _newsListType = type;
    }
    return self;
}

- (NSString *)lastTime {
    return self.dataList.lastObject.lastTime;
}

- (instancetype)init {
    NSAssert(NO, @"必须使用initWithNewsListType: 方法初始化, %s", __FUNCTION__);
    return nil;
}

- (NSMutableArray<CarNewsResultNewslistModel *> *)dataList {
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}


- (NSInteger)rowNumber {
    return self.dataList.count;
}

- (CarNewsResultNewslistModel *)modelForRow:(NSInteger)row {
    return self.dataList[row];
}

- (NSURL *)iconURLForRow:(NSInteger)row {
    return [self modelForRow:row].smallPic.ycl_URL;
}

- (NSString *)titleForRow:(NSInteger)row {
    return [self modelForRow:row].title;
}

- (NSString *)timeForRow:(NSInteger)row {
    return [self modelForRow:row].time;
}

- (NSString *)replyCountForRow:(NSInteger)row {
    NSInteger rc = [self modelForRow:row].replyCount;
    if (rc >= 10000) {
        return [NSString stringWithFormat:@"%.1f万评论", rc / 10000.0];
    }
    return [NSString stringWithFormat:@"%ld评论", rc];
}

- (void)getDataRequestMode:(VMRequestMode)reqeustMode completionHandler:(void (^)(NSError *))completionHandler {
    NSInteger tmpPage = 1;
    NSString *tmpLastTime = nil;
    if (reqeustMode == VMRequestModeMore) {
        tmpPage = _page + 1;
        tmpLastTime = self.lastTime;
    }else {
        tmpLastTime = @"0";
    }
    _dataTask = [YCLNetManager getCarNewsType:_newsListType page:tmpPage lastTime:tmpLastTime completionHandler:^(CarNewsModel *model, NSError *error) {
        if (!error) {
            if (reqeustMode == VMRequestModeRefresh) {
                [self.dataList removeAllObjects];
                _focusList = model.result.focusImg;
            }
            [self.dataList addObjectsFromArray:model.result.newsList];
            _page = tmpPage;
            _isLoadMore = model.result.isLoadMore;
        }
        !completionHandler ?: completionHandler(error);
    }];
}

- (NSURL *)detailURLForRow:(NSInteger)row {
    return [NSString stringWithFormat:kDetailPath, [self modelForRow:row].ID].ycl_URL;
}

- (NSInteger )headerNumber {
    return _focusList.count;
}

- (NSURL *)iconURLForHeaderAtIndex:(NSInteger)index {
    return self.focusList[index].imgURL.ycl_URL;
}

@end
