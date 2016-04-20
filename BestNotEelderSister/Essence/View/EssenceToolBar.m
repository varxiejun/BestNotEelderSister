//
//  EssenceToolBar.m
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/31.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "EssenceToolBar.h"
#import "Common.h"
#import <Masonry.h>

@interface EssenceToolBar ()

@property (nonatomic, weak) UIButton *upBtn;

@property (nonatomic, weak) UIButton *downBtn;
@property (nonatomic, weak) UIButton *forwardBtn;
@property (nonatomic, weak) UIButton *commentBtn;

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) NSMutableArray *btns;
@property (nonatomic, strong) NSMutableArray *dividers;

@end

@implementation EssenceToolBar
- (NSMutableArray *)btns
{
    if (_btns == nil) {
        self.btns = [NSMutableArray array];
    }
    return _btns;
}

- (NSMutableArray *)dividers
{
    if (_dividers == nil) {
        self.dividers = [NSMutableArray array];
    }
    return _dividers;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
        self.backgroundColor = [UIColor whiteColor];

    }return self;
}

- (void)createUI
{
    self.upBtn = [self setupBtnWithIcon:@"zan" title:@"1024"];
    self.downBtn = [self setupBtnWithIcon:@"nozan" title:@"125"];
    self.forwardBtn = [self setupBtnWithIcon:@"share" title:@"128"];
    self.commentBtn = [self setupBtnWithIcon:@"comment" title:@"28"];
    
    self.upBtn.tag = EssenceToolTypeUp;
    self.downBtn.tag = EssenceToolTypeDown;
    self.forwardBtn.tag = EssenceToolTypeForward;
    self.commentBtn.tag = EssenceToolTypeComment;

    self.bottomView = [[UIView alloc] initWithFrame:CGRectZero];
    self.bottomView.backgroundColor = [UIColor colorWithHexString:@"f0eff5" alpha:1.0];
    [self addSubview:_bottomView];
}

- (void)setupAutolayout
{
   
}

/**
 *  分割线
 */
- (void)setupDivider
{
    UIImageView *divider = [[UIImageView alloc] init];
    divider.image = [UIImage imageNamed:@"timeline_card_bottom_line"];
    divider.backgroundColor = [UIColor greenColor];
    divider.contentMode = UIViewContentModeCenter;
    [self addSubview:divider];
    
    [self.dividers addObject:divider];
}

/**
 *  添加按钮
 */
- (UIButton *)setupBtnWithIcon:(NSString *)icon title:(NSString *)title
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    // 设置高亮时的背景
    btn.adjustsImageWhenHighlighted = NO;
    [btn addTarget:self action:@selector(doTap:) forControlEvents:(UIControlEventTouchUpInside)];
    // 设置间距
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [self addSubview:btn];
    [self.btns addObject:btn];
    return btn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 设置按钮的frame
    CGFloat btnY = 0;
    int btnCount = (int)self.btns.count;
    CGFloat btnW = (self.frame.size.width - 9) / btnCount ;
    CGFloat btnH = 40;
    for (int i = 0; i<btnCount; i++) {
        UIButton *btn = self.btns[i];
        
        btn.frame = CGRectMake(i *btnW, btnY, btnW, btnH - btnY * 2);

    }
    
    // 设置分割线的frame
    int dividerCount = (int)self.dividers.count;
    for (int i = 0; i<dividerCount; i++) {
        UIImageView *divider = self.dividers[i];
        CGFloat dividerW = 4;
        CGFloat dividerH = btnH;
        CGFloat dividerX = (i + 1) * btnW - 2;
        CGFloat dividerY = btnH * 0.5 - btnH / 2;
        divider.frame = CGRectMake(dividerX, dividerY, dividerW, dividerH);
    }

    self.bottomView.frame = CGRectMake(0, self.bounds.size.height - 10, ScreenWidth, 10);
}

- (void)doTap:(UIButton *)sender
{
    NSLog(@"%ld",(long)sender.tag);
}

@end
