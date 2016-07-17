//
//  CarNewsModel.m
//  YCLProject
//
//  Created by 杨承龙 on 16/7/17.
//  Copyright © 2016年 Albert. All rights reserved.
//

#import "CarNewsModel.h"

@implementation CarNewsModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"returnCode": @"returncode"};
}
@end
@implementation CarNewsResultModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"focusImg": [CarNewsResultFocusimgModel class],
             @"newsList": [CarNewsResultNewslistModel class]};
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"isLoadMore": @"isloadmore",
             @"rowCount": @"rowcount",
             @"headLineInfo": @"headlineinfo",
             @"focusImg": @"focusimg",
             @"newsList": @"newslist",
             @"topNewsInfo": @"topnewsinfo"};
}
@end


@implementation CarNewsResultHeadlineinfoModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID": @"id",
             @"smallPic": @"smallpic",
             @"replyCount": @"replycount",
             @"lastTime": @"lasttime",
             @"mediaType": @"mediatype",
             @"updateTime": @"updatetime",
             @"jumpPage": @"jumppage",
             @"indexDetail": @"indexdetail",
             @"pageCount": @"pagecount"};
}


@end


@implementation CarNewsResultTopnewsinfoModel

@end


@implementation CarNewsResultNewslistModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID": @"id",
             @"smallPic": @"smallpic",
             @"replyCount": @"replycount",
             @"lastTime": @"lasttime",
             @"mediaType": @"mediatype",
             @"updateTime": @"updatetime",
             @"jumpPage": @"jumppage",
             @"indexDetail": @"indexdetail",
             @"pageCount": @"pagecount",
             @"newsType": @"newstype"};
}

@end


@implementation CarNewsResultFocusimgModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"imgURL": @"imgurl",
             @"jumpURL": @"jumpurl",
             @"updateTime": @"updatetime",
             @"ID": @"id",
             @"replyCount": @"replycount",
             @"pageIndex": @"pageindex",
             @"jumpType": @"JumpType",
             @"mediaType": @"mediatype"};
}

@end


