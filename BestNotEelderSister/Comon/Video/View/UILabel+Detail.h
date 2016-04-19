//
//  UILabel+Detail.h
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/31.
//  Copyright © 2016年 XJ. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UILabel (Detail)

- (void)detailWithStyle:(NSString *)style time:(NSInteger)time;

- (void)dateStrWithdate:(NSTimeInterval)date;

- (void)timeStrWithTime:(NSInteger)time;

@end
