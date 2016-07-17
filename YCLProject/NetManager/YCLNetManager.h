//
//  YCLNetManager.h
//  YCLProject
//
//  Created by 杨承龙 on 16/7/17.
//  Copyright © 2016年 Albert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarNewsModel.h"
//以下几个枚举,对应的请求返回值是一致的
typedef NS_ENUM(NSUInteger, NewsListType) {
    NewsListTypeZuiXin,  //最新
    NewsListTypeXinWen,  //新闻
    NewsListTypePingCe,  //评测
    NewsListTypeDaoGou,     //导购
    NewsListTypeHangQing,  //行情
    NewsListTypeYongChe,   //用车
    NewsListTypeJiShu,  //技术
    NewsListTypeWenHua, //文化
    NewsListTypeGaiZhuang,  //改装
    NewsListTypeYouJi,       //游记
};

@interface YCLNetManager : NSObject
/**
 *  获取'CarNewsModel'解析类型对应的几个请求返回值
 *
 *  @param type              请求的类型
 *  @param page              页数
 *  @param lastTime          以获取的最后一条数据的lastTime
 *  @param completionHandler 完成回调
 *
 *  @return 当前请求任务
 */
+ (id)getCarNewsType:(NewsListType)type page:(NSInteger)page lastTime:(NSString *)lastTime completionHandler:(void(^)(CarNewsModel *model, NSError *error))completionHandler;

@end
