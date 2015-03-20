//
//  CustomSwitch.m
//  CustomSwitch
//
//  Created by wanshaofa on 15/2/3.
//  Copyright (c) 2015年 enuke. All rights reserved.
//

#import "CustomSwitch.h"
#import "SwitchItem.h"
#define kHeight     35
#define kWidth      50

@implementation CustomSwitch{
    NSString *_opTitle;
    NSString *_csTitle;
    
    NSMutableArray *items;
    
    UIView *tintView;
}

-(id)initWithFrame:(CGRect)frame openTitle:(NSString *)opTitle closeTitle:(NSString *)csTitle{
    frame.size.width = kWidth * 2;
    frame.size.height = kHeight;
    self = [super initWithFrame:frame];
    if (self) {
        _opTitle = opTitle;
        _csTitle = csTitle;
        [self initViews];
    }
    return self;
}

-(void)initViews{
    
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    
    NSArray *titles = @[_opTitle,_csTitle];
    items = [NSMutableArray arrayWithCapacity:titles.count];
    for (int i = 0; i < titles.count; i++) {
        SwitchItem *item = [[SwitchItem alloc] initWithFrame:CGRectZero title:titles[i]];
        [self addSubview:item];
        item.tag = i;
        [item addTarget:self action:@selector(switchItemAction:) forControlEvents:UIControlEventTouchUpInside];
        [items addObject:item];
    }
    
    tintView = [[UIView alloc] initWithFrame:CGRectZero];
    tintView.backgroundColor = [UIColor whiteColor];
    tintView.layer.cornerRadius = 3;
    tintView.layer.masksToBounds = YES;
    tintView.userInteractionEnabled = NO;
    [self addSubview:tintView];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    for (int i = 0; i < items.count; i++) {
        SwitchItem *item = items[i];
        item.frame = CGRectMake(i*kWidth, 0, kWidth, kHeight);
        item.selected = NO;
        if (self.on) {
            if (i == 0) {
                item.selected = YES;
            }
        } else {
            if (i == 1) {
                item.selected = YES;
            }
        }
    }
    
    [UIView animateWithDuration:0.35 animations:^{
        if (self.on) {
            tintView.frame = CGRectMake(kWidth + 5/2.0, 5/2.0, kWidth-5, kHeight-5);
        } else {
            tintView.frame = CGRectMake(5/2.0, 5/2.0, kWidth-5, kHeight-5);
        }
    }];
}

-(void)setOn:(BOOL)on{
    _on = on;
    [self setNeedsLayout];
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

-(void)switchItemAction:(SwitchItem *)item{
    self.on = !self.on;
}

@end
