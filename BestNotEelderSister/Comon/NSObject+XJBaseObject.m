//
//  NSObject+XJBaseObject.m
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/31.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "NSObject+XJBaseObject.h"
#define ScreenWidth [[UIScreen mainScreen]bounds].size.width
#define ScreenHeight [[UIScreen mainScreen]bounds].size.height
@implementation NSObject (XJBaseObject)
+ (CGFloat(^)(CGFloat))sizeW
{
    return ^(CGFloat size){
        return size * (ScreenWidth / 375.0);
    };
}

+ (CGFloat(^)(CGFloat))sizeH
{
    return ^(CGFloat size){
        return size * (ScreenHeight / 667.0);
    };
}
@end
