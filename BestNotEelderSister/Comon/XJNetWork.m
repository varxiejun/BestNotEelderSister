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
 *  把网络请求得到的错误信息,转化成相应的NSDictionary
 *
 *  @param error 网络请求错误信息
 *  @return 返回所需格式的 NSDictionary
 */
- (NSDictionary *)getErrorDictionary:(NSError *)error
{
    NSMutableDictionary *errDic = [NSMutableDictionary dictionary];
    errDic[@"code"] = [NSString stringWithFormat:@"%ld",(long)error.code];
    errDic[@"message"] = error.domain;
    errDic[@"data"] = error.userInfo;
    
    return errDic;
}
/**
 *  监测网络状态
 */
-(void)reachNet
{
    __weak typeof(self) myself = self;
    reachabilityManager = [AFNetworkReachabilityManager sharedManager];
    
    [reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status)
     {
         switch (status) {
             case AFNetworkReachabilityStatusReachableViaWWAN:
             {
                  XJLog(@"移动网络");
                 if (self.statusReachableViaWWAN != nil) {
                     myself.statusReachableViaWWAN();
                 }
                 break;
             }
                 
             case AFNetworkReachabilityStatusReachableViaWiFi:
             {
                   XJLog(@"WiFi");
                 if (self.statusReachableVieWiFi != nil) {
                     myself.statusReachableVieWiFi();
                 }
                 break;
             }
             case AFNetworkReachabilityStatusNotReachable:
             {
                 XJLog(@"没有网络");
                 if (self.statusNotReachable != nil) {
                     myself.statusNotReachable();
                 }
             }
             default:
                 break;
         }
     }];
    // 开始监测网络
    [reachabilityManager startMonitoring];
}
/**
 *  网络连接状态
 *
 *  @return BOOL
 */
- (BOOL)connected
{
    return [reachabilityManager isReachable];
}

- (void)startGetRequest:(NSString *)url withParameters:(NSDictionary *)dic callBack:(RequestCallBack)requestCallBack
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"os"];
    
    // 设置超时时间
    
    //获取当前打开软件的版本号
    NSDictionary *infoDic = [NSBundle mainBundle].infoDictionary;
    NSString *currentVersion = infoDic[@"CFBundleShortVersionString"];
    [manager.requestSerializer setValue:currentVersion forHTTPHeaderField:@"appVersion"];
    [manager.requestSerializer setValue:[UIDevice currentDevice].model forHTTPHeaderField:@"model"];
    [manager.requestSerializer setValue:[UIDevice currentDevice].systemVersion forHTTPHeaderField:@"release"];
    manager.requestSerializer.timeoutInterval = 10;
    
    [manager GET:url parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //返回数据为非NSDictionary格式时直接返回
        if (![responseObject isKindOfClass:[NSDictionary class]])
        {
            return;
        }
        //如果返回码为登录超时,则发送相应的广播通知,有Controller的基类做相应的处理
//        NSInteger nCode = [[(NSDictionary *)responseObject objectForKey:@"code"] integerValue];
//        if (nCode == 1) // 登陆态失效
//        {
//            [NOTIFICATION postNotificationName:LoginStatusChange object:@NO];
//            requestCallBack(responseObject);
//            return;
//        }
        requestCallBack(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //组装成所需要的业务数据
        NSDictionary *errDic = [self getErrorDictionary:error];
        XJLog(@"-----get----error----");
        //通过回调把错误带出去
        requestCallBack(errDic);
    }];
}

- (void)startGetRequest:(NSString *)url withParameters:(NSDictionary *)dic callBack:(RequestCallBack)requestCallBack timeoutInterval:(CGFloat)timeoutInterval
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"os"];
    
    // 设置超时时间
    
    //获取当前打开软件的版本号
    NSDictionary *infoDic = [NSBundle mainBundle].infoDictionary;
    NSString *currentVersion = infoDic[@"CFBundleShortVersionString"];
    [manager.requestSerializer setValue:currentVersion forHTTPHeaderField:@"appVersion"];
    [manager.requestSerializer setValue:[UIDevice currentDevice].model forHTTPHeaderField:@"model"];
    [manager.requestSerializer setValue:[UIDevice currentDevice].systemVersion forHTTPHeaderField:@"release"];
    manager.requestSerializer.timeoutInterval = timeoutInterval;
    
    [manager GET:url parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //返回数据为非NSDictionary格式时直接返回
        if (![responseObject isKindOfClass:[NSDictionary class]])
        {
            return;
        }

        requestCallBack(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //组装成所需要的业务数据
        NSDictionary *errDic = [self getErrorDictionary:error];
        XJLog(@"-----get----error----");
        
        //通过回调把错误带出去
        requestCallBack(errDic);
        
    }];
}

- (void)startPostRequest:(NSString *)url withParameters:(NSDictionary *)dic callBack:(RequestCallBack)requestCallBack
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"os"];
    
    //获取当前打开软件的版本号
    NSDictionary *infoDic = [NSBundle mainBundle].infoDictionary;
    NSString *currentVersion = infoDic[@"CFBundleShortVersionString"];
    [manager.requestSerializer setValue:currentVersion forHTTPHeaderField:@"appVersion"];
    [manager.requestSerializer setValue:[UIDevice currentDevice].model forHTTPHeaderField:@"model"];
    [manager.requestSerializer setValue:[UIDevice currentDevice].systemVersion forHTTPHeaderField:@"release"];
    manager.requestSerializer.timeoutInterval = 10;
    
    [manager POST:url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (![responseObject isKindOfClass:[NSDictionary class]]){
            return;
        }
        requestCallBack(responseObject);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        XJLog(@"-----post----error----");
        requestCallBack([self getErrorDictionary:error]);
    }];
}

@end
