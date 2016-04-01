//
//  EssenceToolBar.h
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/31.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, EssenceToolType){
    /**
     *  点赞
     */
    EssenceToolTypeUp = 0,
    /**
     *  鄙视
     */
    EssenceToolTypeDown,
    /**
     *  分享
     */
    EssenceToolTypeForward,
    /**
     *  评论
     */
    EssenceToolTypeComment
    
};

@interface EssenceToolBar : UIView

@end
