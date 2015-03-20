//
//  Circle.m
//  CircleAnimationViewDemo
//
//  Created by wanshaofa on 15/1/30.
//  Copyright (c) 2015年 enuke. All rights reserved.
//

#import "Circle.h"
#import "Thub.h"

@interface Circle ()
@property (nonatomic, strong) Thub *thub;
@property (nonatomic, assign) CGPoint cpCenter;
@property (nonatomic, assign) CGFloat radius;
@end

@implementation Circle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.cpCenter = CGPointMake(frame.size.width/2.0, frame.size.height/2.0);
        self.radius = MIN(self.frame.size.width/2.0, self.frame.size.height/2.0) - 5;
        [self initViews];
    }
    return self;
}

-(void)awakeFromNib{
    CGRect frame = self.bounds;
    self.cpCenter = CGPointMake(frame.size.width/2.0, frame.size.height/2.0);
    self.radius = MIN(frame.size.width/2.0, frame.size.height/2.0)-5;
    [self initViews];
}

-(void)initViews{
    
    self.backgroundColor = [UIColor clearColor];
    
    _thub = [[Thub alloc] initWithFrame:self.bounds];
    [self addSubview:_thub];
}

-(void)startRun{
    [UIView animateWithDuration:0.05 animations:^{
        _thub.transform = CGAffineTransformRotate(_thub.transform, M_PI_4/6);
    } completion:^(BOOL finished) {
        [self startRun];
    }];
}

-(void)drawRect:(CGRect)rect{
    [[UIColor colorWithRed:241/255.0 green:67/255.0 blue:56/255.0 alpha:1] set];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter: _cpCenter radius:_radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    [path closePath];
    [path fill];
}

@end
