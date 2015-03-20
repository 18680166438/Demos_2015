//
//  Thub.m
//  CircleAnimationViewDemo
//
//  Created by wanshaofa on 15/1/30.
//  Copyright (c) 2015年 enuke. All rights reserved.
//

#import "Thub.h"

@interface Thub ()
@property (nonatomic, strong) UIBezierPath *arc;
@property (nonatomic, assign) CGPoint cpCenter;
@property (nonatomic, assign) CGFloat radius;
@end

@implementation Thub

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.cpCenter = CGPointMake(frame.size.width/2.0, frame.size.height/2.0);
        self.radius = MIN(frame.size.width/2.0, frame.size.height/2.0);
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    
//    CGRect frame = self.frame;
//    self.cpCenter = CGPointMake(frame.size.width/2.0, frame.size.height/2.0);
//    self.radius = MIN(frame.size.width/2.0, frame.size.height/2.0);
    
    [[UIColor whiteColor] set];
    
    self.arc = [UIBezierPath bezierPathWithArcCenter: _cpCenter radius:_radius startAngle:0 endAngle:M_PI/3 clockwise:YES];
    [_arc addArcWithCenter:_cpCenter radius:_radius-5 startAngle:M_PI/3 endAngle:0 clockwise:NO];
    [_arc closePath];
    
    [_arc fill];
}

@end
