//
//  YCLCarNewsCell.m
//  YCLProject
//
//  Created by 杨承龙 on 16/7/17.
//  Copyright © 2016年 Albert. All rights reserved.
//

#import "YCLCarNewsCell.h"

@implementation YCLCarNewsCell
#pragma mark - LazyLoad 懒加载
- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(80, 60));
            make.centerY.equalTo(0);
            make.left.equalTo(10);
        }];
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
        _iconIV.clipsToBounds = YES;
        _iconIV.layer.cornerRadius = 5;
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        _titleLb.numberOfLines = 0;
        _titleLb.font = [UIFont systemFontOfSize:16];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconIV);
            make.left.equalTo(self.iconIV.mas_right).equalTo(8);
            make.right.equalTo(-8);
            make.height.lessThanOrEqualTo(50);
        }];
    }
    return _titleLb;
}

- (UILabel *)replyCountLb {
    if(_replyCountLb == nil) {
        _replyCountLb = [[UILabel alloc] init];
        [self.contentView addSubview:_replyCountLb];
        _replyCountLb.font = [UIFont systemFontOfSize:14];
        [_replyCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.titleLb);
            make.bottom.equalTo(self.timeLb);
        }];
        _replyCountLb.textColor = [UIColor darkGrayColor];
    }
    return _replyCountLb;
}

- (UILabel *)timeLb {
    if(_timeLb == nil) {
        _timeLb = [[UILabel alloc] init];
        [self.contentView addSubview:_timeLb];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLb);
            make.bottom.equalTo(self.iconIV);
        }];
        _timeLb.font = [UIFont systemFontOfSize:14];
        _timeLb.textColor = [UIColor darkGrayColor];
    }
    return _timeLb;
}

#pragma mark - LifeCycle 生命周期
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self replyCountLb];
        [self iconIV];
        [self titleLb];
        [self timeLb];
        
        self.separatorInset = UIEdgeInsetsZero;
        self.layoutMargins = UIEdgeInsetsZero;
        self.preservesSuperviewLayoutMargins = NO;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    // Configure the view for the selected state
}

@end
