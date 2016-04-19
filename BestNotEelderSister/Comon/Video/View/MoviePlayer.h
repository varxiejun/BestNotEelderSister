//
//  MoviePlayer.h
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/31.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PanDirection){
    PanDirectionHorizontalMoved,
    PanDirectionVerticalMoved
};

@protocol MoviePlayerDelegate <NSObject>

- (void)back;

@end

@interface MoviePlayer : UIView

@property (nonatomic, copy) NSString *title;

@property (nonatomic, weak) id<MoviePlayerDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame URL:(NSURL *)url;

@end
