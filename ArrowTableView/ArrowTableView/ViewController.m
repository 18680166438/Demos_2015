//
//  ViewController.m
//  ArrowTableView
//
//  Created by wanshaofa on 15/3/20.
//  Copyright (c) 2015年 enuke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"row  %d", indexPath.row];
    
    if (indexPath.row == 0) {// 无箭头
        cell.accessoryType = UITableViewCellAccessoryNone;
    } else if(indexPath.row %2 == 0){// 带箭头
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {//其他的样式
        cell.accessoryType = UITableViewCellAccessoryDetailButton;
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 100;
    }
    return 60;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
