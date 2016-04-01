//
//  EssencePhotoCell.m
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/31.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "EssencePhotoCell.h"
#import "EssenceHeader.h"
#import "EssenceToolBar.h"
#import "List.h"
#import <Masonry.h>
#import "Common.h"
@interface EssencePhotoCell ()
/**
 *  正文
 */
@property (nonatomic, weak) UILabel *contenLabel;
/**
 *  图片
 */
@property (nonatomic, weak) UIImageView *image;
@end

@implementation EssencePhotoCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }return self;
}

- (void)setupAutolayout
{
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    
    [self.contenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headView.mas_bottom).offset(20);
        make.left.right.mas_equalTo(0);
    }];
    
    [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contenLabel.mas_bottom).offset(20);
        make.right.left.mas_equalTo(0);
    }];
}

- (void)setModel:(List *)model
{
    _model = model;
    
}

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
