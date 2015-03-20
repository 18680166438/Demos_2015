//
//  ViewController.m
//  CircleAnimationViewDemo
//
//  Created by wanshaofa on 15/1/30.
//  Copyright (c) 2015年 enuke. All rights reserved.
//

#import "ViewController.h"
#import "Circle.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet Circle *circle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    Circle *circle = [[Circle alloc] initWithFrame:CGRectMake(50, 50, 200,100)];
    [self.view addSubview:circle];
    [circle startRun];
    
    [self.circle startRun];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
