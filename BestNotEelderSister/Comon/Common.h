//
//  Common.h
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/28.
//  Copyright © 2016年 XJ. All rights reserved.
//

#ifndef Common_h
#define Common_h

#ifdef DEBUG                          // 开发阶段 -DEBUG阶段：使用Log
#define XJLog(...) NSLog(__VA_ARGS__)
#else                                 // 发布阶段——上线阶段：移除Log
#define XJLog(...)
#endif

#import "UIColor+Tools.h"
#import "NSObject+XJBaseObject.h"

/**
 *  屏幕宽高
 *
 *  @return CGFloat
 */
#define ScreenWidth [[UIScreen mainScreen]bounds].size.width
#define ScreenHeight [[UIScreen mainScreen]bounds].size.height

#endif /* Common_h */
