//
//  AppDelegate.h
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/28.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, assign) BOOL isRotation;
/**
 *  用户ID
 */
@property (nonatomic, assign) NSInteger number_id;
@end

