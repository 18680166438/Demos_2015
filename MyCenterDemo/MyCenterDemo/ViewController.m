//
//  ViewController.m
//  MyCenterDemo
//
//  Created by wanshaofa on 15/3/13.
//  Copyright (c) 2015年 enuke. All rights reserved.
//

#import "ViewController.h"
#import "MyCenterTableView.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) MyCenterTableView *tableView;
@property (nonatomic, strong) UIView *headView;

@end

@implementation ViewController
-(void)buttonAction{
    NSLog(@"1111111111111111");
}
-(void)tapAction{
    NSLog(@"22222222222222222");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.headView = [[UIView alloc] initWithFrame:CGRectMake(0, -244, 320, 244)];
    self.headView.backgroundColor = [UIColor cyanColor];
    self.headView.layer.masksToBounds = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.headView addGestureRecognizer:tap];
    
//    [self.view addSubview:self.headView];
    
    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:self.headView.bounds];
    backImageView.image = [UIImage imageNamed:@"back.png"];
    [self.headView addSubview:backImageView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, _headView.frame.size.height-100, 70, 70);
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.headView addSubview:button];
    
    self.tableView = [[MyCenterTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.contentInset = UIEdgeInsetsMake(144, 0, 0, 0);
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 44;
    self.tableView.tableHeaderView = [[UIView alloc] init];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView insertSubview:self.headView atIndex:0];
    
//    [self autoLayoutSubViews];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"row = %ld", (long)indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = scrollView.contentOffset.y;
    
    [self scrollTo:y];
}

-(void)scrollTo:(CGFloat)y{
    
    if (y < -144) {
        CGRect frame = CGRectMake(0, -400, 320, 800);
        CGFloat h = -144 - y;
        frame = CGRectMake(frame.origin.x, -400+h, frame.size.width, frame.size.height);
        NSLog(@"y =%f h=%f", y, h);
        UIImageView *img = _headView.subviews[0];
        img.frame = frame;
    } else {
//        CGRect frame = CGRectMake(0, 0, 320, 144);
//        CGFloat h = 144 + y;
//        frame = CGRectMake(frame.origin.x, -h, frame.size.width, 144);
//        _headView.frame = frame;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
