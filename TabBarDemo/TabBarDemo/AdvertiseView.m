//
//  AdvertiseView.m
//  TabBarDemo
//
//  Created by wanshaofa on 15/2/28.
//  Copyright (c) 2015年 enuke. All rights reserved.
//

#import "AdvertiseView.h"
#import "AdItemView.h"
#import "AdModel.h"

@interface AdvertiseView ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
//@property (nonatomic, strong) NSArray *adModels;

@property (nonatomic, strong) NSTimer *timer;



@end

@implementation AdvertiseView{
    NSArray *_urls;
    NSMutableArray *imageViews;
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self initViews];
}

-(void)initViews{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
    
    _urls = [[NSArray alloc] init];
    imageViews = [[NSMutableArray alloc] init];
}

-(void)setAdModels:(NSArray *)adModels{
    _adModels = adModels;
    [self loadImageViews];
}

-(void)loadImageViews{
    [imageViews removeAllObjects];

    for (int i = 0; i < _adModels.count; i++) {
        AdItemView *imageView = [[AdItemView alloc] initWithFrame:CGRectZero];
        [imageViews addObject:imageView];
        [self.scrollView addSubview:imageView];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.scrollView.frame = self.bounds;
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.scrollView.contentSize = CGSizeMake(_urls.count * width, height);
    
    for (int i = 0; i < _adModels.count; i++) {
        AdItemView *imageView = imageViews[i];
        imageView.frame = CGRectMake(i * width, 0, width, height);
        
        AdModel *model = _adModels[i];
        imageView.model = model;
    }
}

-(void)startPlay{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
}
-(void)stopPlay{
    [self.timer invalidate];
    self.timer = nil;
}

-(void)timeAction:(NSTimer *)timer{
    static NSInteger count = 0;
    if (count >= _adModels.count) {
        count = 0;
    }
    if (imageViews.count == 0) {
        return;
    }
    
    AdItemView *imageView = imageViews[count];
    [self.scrollView scrollRectToVisible:imageView.frame animated:YES];
    
    _index = count;
    count++;
}

@end
