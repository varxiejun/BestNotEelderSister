//
//  EssenceVideoCell.m
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/31.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "EssenceVideoCell.h"
#import "EssenceHeader.h"
#import "EssenceToolBar.h"
#import "EssenceLabelView.h"
#import "Video.h"
#import "Common.h"
#import "List.h"
#import <Masonry.h>
#import "MoviePlayerController.h"

@interface EssenceVideoCell ()
/**
 *  播放按钮
 */
@property (nonatomic, weak) UIButton *playBtn;
/**
 *  标签栏
 */
@property (nonatomic, weak) EssenceLabelView *labelView;
@end

@implementation EssenceVideoCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupAutolayout];
    }return self;
}

- (void)setupAutolayout
{
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    
    [self.videoImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(85);
    }];
    
    [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.videoImg.mas_centerX);
        make.centerY.mas_equalTo(self.videoImg.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [self.labelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.videoImg.mas_bottom);
        make.right.left.mas_equalTo(0);
        make.height.mas_equalTo(30);
    }];
    
    [self.toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labelView.mas_bottom).offset(0);
        make.right.left.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
    
}

- (void)setModel:(List *)model
{
    _model = model;
    self.headView.model = model;
    self.labelView.model = model;
  
    
    
}

- (EssenceHeader *)headView
{
    if (!_headView) {
        EssenceHeader *headView = [EssenceHeader new];
        [self.contentView addSubview:headView];
        _headView = headView;
    }return _headView;
}

- (EssenceToolBar *)toolBar
{
    if (!_toolBar) {
        EssenceToolBar *toolBar = [EssenceToolBar new];
        [self.contentView addSubview:toolBar];
        _toolBar = toolBar;
    }return _toolBar;
}

- (UIImageView *)videoImg
{
    if (!_videoImg) {
        UIImageView *videoImg = [[UIImageView alloc] init];
        [self.contentView addSubview:videoImg];
        videoImg.userInteractionEnabled = YES;
        _videoImg = videoImg;
    }return _videoImg;
}

- (UIButton *)playBtn
{
    if (!_playBtn) {
        UIButton *playBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [playBtn addTarget:self action:@selector(doTap:) forControlEvents:(UIControlEventTouchUpInside)];
        [playBtn setTitleColor:[UIColor normalBlue] forState:(UIControlStateNormal)];
        [playBtn setTitle:@"play" forState:(UIControlStateNormal)];
        [self.videoImg addSubview:playBtn];
        _playBtn = playBtn;
    }return _playBtn;
}

- (EssenceLabelView *)labelView
{
    if (!_labelView) {
        EssenceLabelView *labelView = [EssenceLabelView new];
        labelView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:labelView];
        _labelView = labelView;
    }return _labelView;
}

- (void)doTap:(UIButton *)sender
{
    NSLog(@"play");
    Video *video = _model.video;
    NSString *url = [video.video firstObject];
    NSString *title = _model.text;
    if (_play) {
        _play(url,title);
    }
}


- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
