//
//  Slider.h
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/31.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SliderDelegate <NSObject>

- (void)touchView:(float)value;

@end

@interface Slider : UIView

@property (nonatomic, strong) UIView *thumb;

@property (nonatomic, strong) UISlider *slider;
/**
 *  缓冲的进度
 */
@property (nonatomic, assign) CGFloat cache;
/**
 *  缓冲条的颜色
 */
@property (nonatomic, strong) UIColor *cacheColor;

@property (nonatomic, assign) id<SliderDelegate>delegate;

@end
