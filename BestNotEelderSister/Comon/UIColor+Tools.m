//
//  UIColor+Tools.m
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/28.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "UIColor+Tools.h"

@implementation UIColor (Tools)
+ (UIColor *)colorWithRGBAColorRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red / 255.0f green:green / 255.0f blue:blue / 255.0f alpha:alpha /1.0f];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha
{
    unsigned int red, green, blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexString substringWithRange:range]]scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[hexString substringWithRange:range]]scanHexInt:&green];
    range.location = 4;
    [[NSScanner scannerWithString:[hexString substringWithRange:range]]scanHexInt:&blue];
    return [UIColor colorWithRed:(float)(red / 255.0f)green:(float)(green / 255.0f)blue:(float)(blue / 255.0f)alpha:alpha];
}

+ (UIColor *)normalBlue
{
    return [self colorWithHexString:@"1B88EE" alpha:1.0f];
}

+ (UIColor *)normalBlack;
{
    return [self colorWithHexString:@"868686" alpha:1.0f];
}

+ (UIColor *)normalGray
{
    return [self colorWithHexString:@"666666" alpha:1.0f];
}
@end
