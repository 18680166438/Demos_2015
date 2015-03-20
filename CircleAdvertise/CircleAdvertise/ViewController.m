//
//  ViewController.m
//  CircleAdvertise
//
//  Created by wanshaofa on 15/3/18.
//  Copyright (c) 2015年 enuke. All rights reserved.
//

#import "ViewController.h"
#import "CircleCollectionView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet CircleCollectionView *collectionVIew;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSMutableArray *imageNames = [@[@"car1",@"car2",@"car3",@"car4",@"car5"] mutableCopy];
    self.collectionVIew.datas = imageNames;
}
- (IBAction)change:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        NSMutableArray *imageNames = [@[@"car1",@"car2",@"car3",@"car4",@"car5"] mutableCopy];
        self.collectionVIew.datas = imageNames;
    } else {
        NSMutableArray *imageNames = [@[@"car2",@"car5",@"car3",@"car4"] mutableCopy];
        self.collectionVIew.datas = imageNames;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
