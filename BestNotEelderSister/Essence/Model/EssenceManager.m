//
//  EssenceManager.m
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/30.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "EssenceManager.h"

@implementation EssenceManager

+ (void)EssenceListCompleteBlock:(CompleteBlock)successBlock FailureBlock:(FailureBlock)failureBlock
{
    NSString *url = @"http://s.budejie.com/topic/list/jingxuan/1/baisishequ-iphone-4.0/0-20.json";
    [[XJNetWork shareNewWorking] startGetRequest:url withParameters:nil callBack:^(NSDictionary *result) {
        if ([result[@"list"] count] > 0) {
            successBlock(result);
        }else
        {
            failureBlock(result);
        }
    }];
}

@end
