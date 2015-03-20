//
//  SwitchItem.m
//  CustomSwitch
//
//  Created by wanshaofa on 15/2/3.
//  Copyright (c) 2015年 enuke. All rights reserved.
//

#import "SwitchItem.h"

@implementation SwitchItem{
    UILabel *titleLabel;
}

-(id)initWithFrame:(CGRect)frame title:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        _title = title;
        _selectedColor = [UIColor colorWithRed:20/255.0 green:154/255.0 blue:239/255.0 alpha:1];
        _normalolor = [UIColor colorWithRed:20/255.0 green:154/255.0 blue:239/255.0 alpha:0.5];
        
        titleLabel = [[UILabel alloc] initWithFrame:frame];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLabel];
    }
    return self;
}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    [self setNeedsLayout];
}

-(void)setSelectedColor:(UIColor *)selectedColor{
    _selectedColor = selectedColor;
    [self setNeedsLayout];
}

-(void)setNormalolor:(UIColor *)normalolor{
    _normalolor = normalolor;
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    titleLabel.text = _title;
    titleLabel.frame = self.bounds;
    self.backgroundColor = _normalolor;
    if (self.selected) {
        self.backgroundColor = _selectedColor;
    }
}

@end
