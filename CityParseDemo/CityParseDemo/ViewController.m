//
//  ViewController.m
//  CityParseDemo
//
//  Created by wanshaofa on 15/2/2.
//  Copyright (c) 2015年 enuke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"city_quanguo.plist" ofType:nil];
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePath];
    
    NSMutableDictionary *cityDic = [NSMutableDictionary dictionary];
    for (NSDictionary *dict in array) {
        
        NSString *state = dict[@"state"];
        NSArray *citys = dict[@"cities"];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
