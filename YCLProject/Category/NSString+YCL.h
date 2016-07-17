//
//  NSString+YCL.h
//  YCLProject
//
//  Created by 杨承龙 on 16/7/16.
//  Copyright © 2016年 Albert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (YCL)

@property (nonatomic, readonly)  NSURL *ycl_URL;

@property (nonatomic, readonly)  NSURL *ycl_fileURL;

@property (nonatomic, readonly)  UIImage *ycl_image;

@property (nonatomic, readonly)  UIImageView *ycl_imageView;

@end
