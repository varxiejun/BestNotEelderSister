//
//  EssenceHeader.m
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/31.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "EssenceHeader.h"
#import "Common.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "List.h"
#import "U.h"

@interface EssenceHeader ()
/**
 *  头像
 */
@property (nonatomic, weak) UIImageView *iconImg;
/**
 *  昵称
 */
@property (nonatomic, weak) UILabel *nickNameLabel;
/**
 *  时间
 */
@property (nonatomic, weak) UILabel *timeLabel;
/**
 *  右上角按钮
 */
@property (nonatomic, weak) UIButton *rightBtn;

@property (nonatomic, strong) UITapGestureRecognizer *ges;
@end

@implementation EssenceHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        [self setupAutoLayout];
    }return self;
}

- (void)setupAutoLayout
{
    [self.iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(12);
        make.left.mas_equalTo(self.mas_left).offset(17);
        make.size.mas_equalTo(CGSizeMake(45, 45));
    }];
    
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImg.mas_right).offset(7);
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(18);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImg.mas_right).offset(10);
        make.top.mas_equalTo(self.nickNameLabel.mas_bottom).offset(10);
    }];
}

#pragma mark - Getter
- (UIImageView *)iconImg
{
    if (!_iconImg) {
        UIImageView *iconImg = [UIImageView new];
        iconImg.contentMode = UIViewContentModeScaleAspectFill;
        iconImg.userInteractionEnabled = YES;
        [iconImg addGestureRecognizer:self.ges];
        iconImg.clipsToBounds = YES;
        [self addSubview:iconImg];
        _iconImg = iconImg;
    }return _iconImg;
}

- (UILabel *)nickNameLabel
{
    if (!_nickNameLabel) {
        UILabel *nickNameLabel = [UILabel new];
        nickNameLabel.textColor = [UIColor normalBlack];
        nickNameLabel.font = [UIFont systemFontOfSize:15];
        nickNameLabel.userInteractionEnabled = YES;
        [nickNameLabel addGestureRecognizer:self.ges];
        [self addSubview:nickNameLabel];
        _nickNameLabel = nickNameLabel;
    }return _nickNameLabel;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        UILabel *timeLabel = [UILabel new];
        timeLabel.textColor = [UIColor normalBlack];
        timeLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:timeLabel];
        _timeLabel = timeLabel;
    }return _timeLabel;
}

- (UIButton *)rightBtn
{
    if (!_rightBtn) {
        UIButton *rightBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [rightBtn setImage:[UIImage imageNamed:@"info"] forState:(UIControlStateNormal)];
        [rightBtn addTarget:self action:@selector(moreClick:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:rightBtn];
        _rightBtn = rightBtn;
    }return _rightBtn;
}

- (UITapGestureRecognizer *)ges
{
    if (!_ges) {
        UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doTap)];
        _ges = ges;
    }return _ges;
}

- (void)setModel:(List *)model
{
    _model = model;
    
    U * u = model.u;
    NSString *imgUrl = [u.header objectAtIndex:0];
    [self.iconImg sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage new] options:SDWebImageRetryFailed];
    self.nickNameLabel.text = u.name;
    self.timeLabel.text = model.passtime;
}

#pragma mark - Action
- (void)moreClick:(UIButton *)sender
{
    NSLog(@"moreClick");
}

- (void)doTap
{
    NSLog(@"UITapGestureRecognizer");
}



@end
