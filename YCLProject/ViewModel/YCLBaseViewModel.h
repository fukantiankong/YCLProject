//
//  YCLBaseViewModel.h
//  YCLProject
//
//  Created by 杨承龙 on 16/7/17.
//  Copyright © 2016年 Albert. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, VMRequestMode) {
    VMRequestModeRefresh,
    VMRequestModeMore,
};

@interface YCLBaseViewModel : NSObject {
    NSURLSessionDataTask *_dataTask;
}

- (void)getDataRequestMode:(VMRequestMode)reqeustMode completionHandler:(void(^)(NSError *error))completionHandler;

@property (nonatomic, strong)  NSURLSessionDataTask *dataTask;

@end
