//
//  NSString+YCL.m
//  YCLProject
//
//  Created by 杨承龙 on 16/7/16.
//  Copyright © 2016年 Albert. All rights reserved.
//

#import "NSString+YCL.h"

@implementation NSString (YCL)

- (NSURL *)ycl_URL {
    return [NSURL URLWithString:self];
}

- (NSURL *)ycl_fileURL {
    return [NSURL fileURLWithPath:self];
}

- (UIImage *)ycl_image {
    return [UIImage imageNamed:self];
}

- (UIImageView *)ycl_imageView {
    return [[UIImageView alloc] initWithImage:self.ycl_image];
}

@end
