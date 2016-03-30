//
//  XJNetWork.m
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/30.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "XJNetWork.h"

@implementation XJNetWork
+ (instancetype)shareNewWorking
{
    static dispatch_once_t onceToken;
    static XJNetWork *newWork = nil;
    dispatch_once(&onceToken, ^{
        newWork = [[XJNetWork alloc] init];
    });
    return newWork;
}
/**
 *  监测网络状态
 */
-(void)reachNet
{
    
}
/**
 *  网络连接状态
 *
 *  @return BOOL
 */
//- (BOOL)connected
//{
//    
//}
@end
