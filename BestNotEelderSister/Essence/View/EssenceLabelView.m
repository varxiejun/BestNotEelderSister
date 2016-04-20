//
//  EssenceLabelView.m
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/4/5.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "EssenceLabelView.h"
#import "List.h"
#import "Tags.h"
@implementation EssenceLabelView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    NSArray *array = _model.tags;
    CGFloat width = 0;
    for (int i = 0; i < array.count - 1; i++) {
        if (width >= [UIScreen mainScreen].bounds.size.width) {
            return;
        }
        Tags *tag = [array objectAtIndex:i];
        CGFloat titleW = [self widthWithString:tag.name];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(width + 5, 0, titleW, 20)];
        label.font = [UIFont systemFontOfSize:14];
        width = width + 5 + titleW;
        label.text = tag.name;
        [self addSubview:label];
    }
}

- (void)setModel:(List *)model
{
    _model = model;
    
}

- (CGFloat)widthWithString:(NSString *)string
{
    CGSize size = [string boundingRectWithSize:CGSizeMake(0, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]}  context:nil].size;
    return size.width;
}
@end
