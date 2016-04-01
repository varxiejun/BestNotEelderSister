//
//  EssencePhotoCell.h
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/31.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EssenceHeader,EssenceToolBar,List;
@interface EssencePhotoCell : UITableViewCell
/**
 *  头视图
 */
@property (nonatomic, strong) EssenceHeader *headView;
/**
 *  底部toolBar
 */
@property (nonatomic, strong) EssenceToolBar *toolBar;
/**
 *  数据
 */
@property (nonatomic, strong) List *model;
@end
