//
//  AdvertiseView.h
//  TabBarDemo
//
//  Created by wanshaofa on 15/2/28.
//  Copyright (c) 2015年 enuke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdvertiseView : UIView
@property (nonatomic, strong) NSArray *adModels;
@property (nonatomic, assign) NSInteger index;

-(void)startPlay;
-(void)stopPlay;

@end
