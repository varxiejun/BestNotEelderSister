//
//  AppDelegate.m
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/28.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "AppDelegate.h"
#import "XJViewController.h"
#import "LoginViewController.h"
#import "XJNavigationController.h"
#import <RongIMKit/RongIMKit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [[XJNavigationController alloc] initWithRootViewController:[[LoginViewController alloc] init]];
    
    [[RCIM sharedRCIM] initWithAppKey:@"pwe86ga5em1k6"];
    
    // 登陆后调用----------
    
    NSString *token_12 = @"6nrEkfWMGVPDYiAlX5vNLdO+qemTMG2MTjmu+sL77Gof0I7RxBuBKezPL4IlbnYVtqorPT3jIMI=";
    NSString *token_10 = @"LYcT5bvNNRUeYmT304ijoz+2u4MkW9PaGQe4tGpSKzjGZkv3h+D/jIPRrzChor1re9n9O0AVrZgF4R4VjvHlUg==";
    NSString *token = token_10;
    if ([token isEqualToString:token_10]) {
        _number_id = 12;
    }else{
        _number_id = 10;
    }
    //
    [[RCIM sharedRCIM] connectWithToken:token success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%ld", (long)status);
    } tokenIncorrect:^{
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token错误");
    }];

    
//    XJViewController *xjVC = [[XJViewController alloc] init];
//    self.window.rootViewController = xjVC;
    
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark 支持横竖屏切换的方法
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
    if (_isRotation) {
        //如果是YES，只支持横屏
        return UIInterfaceOrientationMaskLandscape;
    }
    //只支持竖屏
    return UIInterfaceOrientationMaskPortrait;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
