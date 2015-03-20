//
//  AdItemView.m
//  TabBarDemo
//
//  Created by wanshaofa on 15/2/28.
//  Copyright (c) 2015年 enuke. All rights reserved.
//

#import "AdItemView.h"
#import "AdModel.h"

@implementation AdItemView

-(void)setModel:(AdModel *)model{
    _model = model;
    [self setNeedsLayout];
}

-(void)layoutSubviews{

}

@end
