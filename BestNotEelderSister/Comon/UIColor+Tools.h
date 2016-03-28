//
//  UIColor+Tools.h
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/28.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Tools)
/**
 *  RGB Color
 *
 *  @param red   redColor
 *  @param green greenColor
 *  @param blue  blueColor
 *  @param alpha alpha
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithRGBAColorRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
/**
 *  十六进制color
 *
 *  @param hexString 十六进制
 *  @param alpha     alpha
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
/**
 *  通用蓝(1B88EE)
 *
 *  @return 0x1B88EE
 */
+ (UIColor *)normalBlue;
/**
 *  通用黑色(868686)
 *
 *  @return 0x868686
 */
+ (UIColor *)normalBlack;
/**
 *  通用灰色(666666)
 *
 *  @return 0x666666
 */
+ (UIColor *)normalGray;

@end
