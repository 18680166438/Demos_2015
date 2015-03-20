//
//  ViewController.m
//  CustomSwitch
//
//  Created by wanshaofa on 15/2/3.
//  Copyright (c) 2015年 enuke. All rights reserved.
//

#import "ViewController.h"
#import "CustomSwitch.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CustomSwitch *sw = [[CustomSwitch alloc] initWithFrame:CGRectMake(100, 200, 0, 0) openTitle:@"满载" closeTitle:@"空载"];
    [sw addTarget:self action:@selector(swAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sw];
    
    UISwitch *swi = [[UISwitch alloc] initWithFrame:CGRectMake(100, 300, 0, 0)];
    [self.view addSubview:swi];
}

-(void)swAction:(CustomSwitch *)sw{
    NSLog(@"%d", sw.on);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
