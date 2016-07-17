//
//  CarNewsModel.h
//  YCLProject
//
//  Created by 杨承龙 on 16/7/17.
//  Copyright © 2016年 Albert. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CarNewsResultModel, CarNewsResultHeadlineinfoModel,CarNewsResultTopnewsinfoModel, CarNewsResultNewslistModel,CarNewsResultFocusimgModel;
@interface CarNewsModel : NSObject

@property (nonatomic, strong) CarNewsResultModel *result;
//returncode -> returnCode
@property (nonatomic, assign) NSInteger returnCode;

@property (nonatomic, copy) NSString *message;

@end
@interface CarNewsResultModel : NSObject
//isloadmore -> isLoadMore
@property (nonatomic, assign) BOOL isLoadMore;
//rowcount -> rowCount
@property (nonatomic, assign) NSInteger rowCount;
//headlineinfo -> headLineInfo
@property (nonatomic, strong) CarNewsResultHeadlineinfoModel *headLineInfo;
//focusimg -> focusImg
@property (nonatomic, strong) NSArray<CarNewsResultFocusimgModel *> *focusImg;
//newslist -> newsList
@property (nonatomic, strong) NSArray<CarNewsResultNewslistModel *> *newsList;
//topnewsinfo -> topNewsInfo
@property (nonatomic, strong) CarNewsResultTopnewsinfoModel *topNewsInfo;

@end

@interface CarNewsResultHeadlineinfoModel : NSObject
//id -> ID
@property (nonatomic, assign) NSInteger ID;
//smallpic -> smallPic
@property (nonatomic, copy) NSString *smallPic;
//replycount -> replyCount
@property (nonatomic, assign) NSInteger replyCount;
//lasttime -> lastTime
@property (nonatomic, copy) NSString *lastTime;

@property (nonatomic, copy) NSString *time;
//mediatype -> mediaType
@property (nonatomic, assign) NSInteger mediaType;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *type;
//updatetime -> updateTime
@property (nonatomic, copy) NSString *updateTime;
//jumppage -> jumpPage
@property (nonatomic, assign) NSInteger jumpPage;
//indexdetail -> indexDetail
@property (nonatomic, copy) NSString *indexDetail;
//pagecount -> pageCount
@property (nonatomic, assign) NSInteger pageCount;

@end

@interface CarNewsResultTopnewsinfoModel : NSObject
@end

@interface CarNewsResultNewslistModel : NSObject
//id -> ID
@property (nonatomic, assign) NSInteger ID;
//smallpic -> smallPic
@property (nonatomic, copy) NSString *smallPic;
//replycount -> replyCount
@property (nonatomic, assign) NSInteger replyCount;
//lasttime -> lastTime
@property (nonatomic, copy) NSString *lastTime;

@property (nonatomic, copy) NSString *time;
//mediatype -> mediaType
@property (nonatomic, assign) NSInteger mediaType;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *type;
//updatetime -> updateTime
@property (nonatomic, copy) NSString *updateTime;
//jumppage -> jumpPage
@property (nonatomic, assign) NSInteger jumpPage;
//indexdetail -> indexDetail
@property (nonatomic, copy) NSString *indexDetail;
//pagecount -> pageCount
@property (nonatomic, assign) NSInteger pageCount;
//newstype -> newsType
@property (nonatomic, assign) NSInteger newstype;

@end

@interface CarNewsResultFocusimgModel : NSObject
//imgurl -> imgURL
@property (nonatomic, copy) NSString *imgURL;
//jumpurl -> jumpURL
@property (nonatomic, copy) NSString *jumpURL;
//updatetime -> updateTime
@property (nonatomic, copy) NSString *updateTime;
//id -> ID
@property (nonatomic, assign) NSInteger ID;
//replycount -> replyCount
@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, copy) NSString *title;
//pageindex -> pageIndex
@property (nonatomic, assign) NSInteger pageIndex;
//JumpType -> jumpType
@property (nonatomic, assign) NSInteger jumpType;
//mediatype -> mediaType
@property (nonatomic, assign) NSInteger mediaType;

@property (nonatomic, copy) NSString *type;

@end

