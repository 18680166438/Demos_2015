//
//  CustomSwitch.h
//  CustomSwitch
//
//  Created by wanshaofa on 15/2/3.
//  Copyright (c) 2015年 enuke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSwitch : UIControl
@property (nonatomic, assign) BOOL on;

-(id)initWithFrame:(CGRect)frame openTitle:(NSString *)opTitle closeTitle:(NSString *)csTitle;
@end
