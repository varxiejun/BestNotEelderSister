//
//  EssenceVideoCell.h
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/31.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Play)(NSString *,NSString *);

@class EssenceHeader,EssenceToolBar,EssenceLabelView,MoviePlayerController,List;
@interface EssenceVideoCell : UITableViewCell
/**
 *  头视图
 */
@property (nonatomic, weak) EssenceHeader *headView;
/**
 *  底部toolBar
 */
@property (nonatomic, weak) EssenceToolBar *toolBar;
/**
 *  播放图片
 */
@property (nonatomic, strong) UIImageView *videoImg;
/**
 *  数据
 */
@property (nonatomic, strong) List *model;
@property (nonatomic, copy) Play play;
@end
