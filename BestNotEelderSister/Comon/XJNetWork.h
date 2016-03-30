//
//  XJNetWork.h
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/30.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

// 定义网络改变时执行方法的block
typedef void(^NetViaWWANBlock)();
typedef void(^NetViaWiFiBlock)();
typedef void(^NoNetBlock)();
typedef void(^UnknownNet)();

typedef void(^RequestCallBack)(NSDictionary *result);

@interface XJNetWork : NSObject
{
    AFNetworkReachabilityManager *reachabilityManager; // 创建网络管理类
    AFHTTPRequestSerializer *operation;  // 创建下载管理
}
/**
 *  初始化
 */
+ (instancetype)shareNewWorking;
/**
 *  监测网络状态
 */
-(void)reachNet;
/**
 *  网络连接状态
 *
 *  @return BOOL
 */
- (BOOL)connected;
/**
 *  GET请求
 *
 *  @param url             请求地址
 *  @param dic             请求参数
 *  @param requestCallBack 返回结果
 */
- (void)startGetRequest:(NSString *)url withParameters:(NSDictionary *)dic callBack:(RequestCallBack)requestCallBack;
/**
 *  GET请求(自定超时时间)
 *
 *  @param url             请求地址
 *  @param dic             请求参数
 *  @param requestCallBack 返回结果
 *  @param timeoutInterval 超时时间
 */
- (void)startGetRequest:(NSString *)url withParameters:(NSDictionary *)dic callBack:(RequestCallBack)requestCallBack timeoutInterval:(CGFloat)timeoutInterval;
/**
 *  POST请求
 *
 *  @param url             请求地址
 *  @param dic             请求参数
 *  @param requestCallBack 返回结果
 */
- (void)startPostRequest:(NSString *)url withParameters:(NSDictionary *)dic callBack:(RequestCallBack)requestCallBack;

@end
