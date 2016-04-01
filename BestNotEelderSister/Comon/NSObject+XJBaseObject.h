//
//  NSObject+XJBaseObject.h
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/31.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSObject (XJBaseObject)
/**
 *  适配宽度(iPhone 6)
 */
+ (CGFloat(^)(CGFloat))sizeW;
/**
 *  适配高度(iPhone 6)
 */
+ (CGFloat(^)(CGFloat))sizeH;

@end
