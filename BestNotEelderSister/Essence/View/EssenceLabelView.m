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

- (void)setModel:(List *)model
{
    NSArray *array = model.tags;

    for (int i = 0; i < array.count - 1; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        Tags *tag = [array objectAtIndex:i];
        label.text = tag.name;
        [self addSubview:label];
    }
}

@end
