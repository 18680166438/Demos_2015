//
//  SwitchItem.h
//  CustomSwitch
//
//  Created by wanshaofa on 15/2/3.
//  Copyright (c) 2015年 enuke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwitchItem : UIControl
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, strong) UIColor *normalolor;

-(id)initWithFrame:(CGRect)frame title:(NSString *)title;

@end
