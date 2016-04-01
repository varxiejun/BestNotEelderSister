//
//  EssenceManager.h
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/30.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XJNetWork.h"
@interface EssenceManager : NSObject
/**
 *  精华推荐list
 *
 *  @param successBlock 返回成功数据
 *  @param failureBlock 返回失败结果
 */
+ (void)EssenceListCompleteBlock:(CompleteBlock)successBlock FailureBlock:(FailureBlock)failureBlock;
@end
