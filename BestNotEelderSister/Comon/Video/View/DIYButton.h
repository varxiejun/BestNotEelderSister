//
//  DIYButton.h
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/31.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DIYButton : UIButton
/**
 *  button的图片显示
 */
@property (nonatomic, strong, readonly) UIImageView *icon;
/**
 *  button selected状态下的图片
 */
@property (nonatomic, strong, readonly) UIImageView *iconSelected;
/**
 *  文字
 */
@property (nonatomic, strong, readonly) UILabel *textLabel;

@end
