//
//  MoviePlayerController.h
//  Eyes
//
//  Created by 雨天记忆 on 15/8/19.
//  Copyright (c) 2015年 Rebirth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoviePlayerController : UIViewController

//视频播放 所需要的model
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *titleName;

@end
