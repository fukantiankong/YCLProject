//
//  YCLNetManager.m
//  YCLProject
//
//  Created by 杨承龙 on 16/7/17.
//  Copyright © 2016年 Albert. All rights reserved.
//

#import "YCLNetManager.h"

@implementation YCLNetManager

+ (id)getCarNewsType:(NewsListType)type page:(NSInteger)page lastTime:(NSString *)lastTime completionHandler:(void (^)(CarNewsModel *, NSError *))completionHandler{
    NSString *path = nil;
    switch (type) {
        case NewsListTypeZuiXin: {
            path = [NSString stringWithFormat:kNewsListPath, page, lastTime];
            break;
        }
        case NewsListTypeXinWen: {
            path = [NSString stringWithFormat:kXinWenPath, page, lastTime];
            break;
        }
        case NewsListTypePingCe: {
            path = [NSString stringWithFormat:kPingCePath, page, lastTime];
            break;
        }
        case NewsListTypeDaoGou: {
            path = [NSString stringWithFormat:kDaoGouPath, page, lastTime];
            break;
        }
        case NewsListTypeHangQing: {
            path = [NSString stringWithFormat:kHangQingPath, page, lastTime];
            break;
        }
        case NewsListTypeYongChe: {
            path = [NSString stringWithFormat:kYongChePath, page, lastTime];
            break;
        }
        case NewsListTypeJiShu: {
            path = [NSString stringWithFormat:kJiShuPath, page, lastTime];
            break;
        }
        case NewsListTypeWenHua: {
            path = [NSString stringWithFormat:kWenHuaPath, page, lastTime];
            break;
        }
        case NewsListTypeGaiZhuang: {
            path = [NSString stringWithFormat:kGaiZhuangPath, page, lastTime];
            break;
        }
        case NewsListTypeYouJi: {
            path = [NSString stringWithFormat:kYouJiPath, page, lastTime];
            break;
        }
    }
    
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([CarNewsModel parseJSON:jsonObject], error);
    }];
}

@end
