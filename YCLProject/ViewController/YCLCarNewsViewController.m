//
//  YCLCarNewsViewController.m
//  YCLProject
//
//  Created by 杨承龙 on 16/7/17.
//  Copyright © 2016年 Albert. All rights reserved.
//

#import "YCLCarNewsViewController.h"
#import "YCLCarNewsCell.h"
#import <iCarousel.h>
#import "YCLDetailViewController.h"
//#import "YCLCarNewsViewModel.h"


@interface YCLCarNewsViewController ()<iCarouselDelegate, iCarouselDataSource>
@property (nonatomic)  YCLCarNewsViewModel *carNewsVM;
@property (nonatomic, strong)  iCarousel *ic;
@property (nonatomic, strong)  UIPageControl *pc;

@end

@implementation YCLCarNewsViewController {
    NSTimer *_timer;
}

#pragma mark - LifeCycle 生命周期
- (instancetype)initWithStyle:(UITableViewStyle)style newsListType:(NewsListType)type {
    if (self = [super initWithStyle:style]) {
        _newsListType = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"汽车之家";
    self.tableView.rowHeight = 70;
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[YCLCarNewsCell class] forCellReuseIdentifier:@"CarNewsCell"];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.carNewsVM getDataRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                DDLogError(@"%@", error);
            }else {
                if (self.carNewsVM.headerNumber > 0) {
                    self.tableView.tableHeaderView = self.ic;
                }else {
                    self.tableView.tableHeaderView = nil;
                }
                [self.tableView reloadData];
                if (self.carNewsVM. isLoadMore) {
                    [self.tableView.mj_footer resetNoMoreData];
                }else {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
            [self.tableView.mj_header endRefreshing];
        }];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.carNewsVM getDataRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            [self.tableView.mj_footer endRefreshing];
            if (error) {
                DDLogError(@"%@", error);
            }else {
                [self.tableView reloadData];
                if (!self.carNewsVM.isLoadMore) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
        }];
    }];
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.carNewsVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YCLCarNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CarNewsCell" forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    [cell.iconIV sd_setImageWithURL:[self.carNewsVM iconURLForRow:row] placeholderImage:[UIImage imageNamed:@"ImageError@3x"]];
    cell.titleLb.text = [self.carNewsVM titleForRow:row];
    cell.timeLb.text = [self.carNewsVM timeForRow:row];
    cell.replyCountLb.text = [self.carNewsVM replyCountForRow:row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YCLDetailViewController * vc = [[YCLDetailViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - LazyLoad 懒加载
- (YCLCarNewsViewModel *)carNewsVM {
    if(_carNewsVM == nil) {
        _carNewsVM = [[YCLCarNewsViewModel alloc] initWithNewsListType:_newsListType];
    }
    return _carNewsVM;
}

- (iCarousel *)ic {
    if(_ic == nil) {
        _ic = [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, 0, kScreenW / 2)];
        _ic.delegate = self;
        _ic.dataSource = self;
        
        _pc = [[UIPageControl alloc] init];
        _pc.numberOfPages = self.carNewsVM.headerNumber;
        [_ic addSubview:_pc];
        [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(4);
            make.right.equalTo(-4);
        }];
        [_timer invalidate];
        _timer = nil;
        
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
        } repeats:YES];
        _ic.scrollSpeed = .2;
    }
    return _ic;
}

#pragma mark - ic Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return self.carNewsVM.headerNumber;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    if (!view) {
        view = [[UIView alloc] initWithFrame:carousel.bounds];
        UIImageView *iv = [UIImageView new];
        iv.tag = 100;
        [view addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        iv.contentMode = UIViewContentModeScaleAspectFill;
    }
    UIImageView *iv = (UIImageView *)[view viewWithTag:100];
    [iv sd_setImageWithURL:[self.carNewsVM iconURLForHeaderAtIndex:index] placeholderImage:[UIImage imageNamed:@"ImageError@3x"]];
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value {
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel {
    _pc.currentPage = carousel.currentItemIndex;
}

@end
