//
//  CircleCollectionView.m
//  CircleAdvertise
//
//  Created by wanshaofa on 15/3/18.
//  Copyright (c) 2015年 enuke. All rights reserved.
//

#import "CircleCollectionView.h"
#import "CircleCollectionViewCell.h"

#define kCellHeigt      200

@interface CircleCollectionView ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation CircleCollectionView

-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.dataSource = self;
    self.delegate = self;
    
    self.pagingEnabled = YES;
    
    UINib *nib = [UINib nibWithNibName:@"CircleCollectionViewCell" bundle:nil];
    [self registerNib:nib forCellWithReuseIdentifier:@"CircleCollectionViewCell"];
    _currentPage = 0;
}

-(void)setDatas:(NSMutableArray *)datas{
    
    if (datas.count >= 2) {
        _datas = [NSMutableArray array];
        [_datas addObject:[datas lastObject]];
        [_datas addObjectsFromArray:datas];
        [_datas addObject:[datas firstObject]];
        [self run];
    }else {
        _datas = datas;
    }
    
    [self reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _datas.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CircleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CircleCollectionViewCell" forIndexPath:indexPath];
    cell.img = _datas[indexPath.item];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, kCellHeigt);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return .1;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return .1;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld", (long)indexPath.item);
}


-(void)run{
    [self.timer invalidate];
    self.timer = nil;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
}

-(void)timeAction:(NSTimer *)timer{
    
    
    CGPoint p = CGPointMake(_currentPage * self.frame.size.width, 0);
    [self setContentOffset:p animated:YES];
    
    if (_currentPage == self.datas.count-1) {
        _currentPage = 1;
    }
    
    _currentPage++;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.timer invalidate];
    self.timer = nil;
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat x = scrollView.contentOffset.x;
    
    NSInteger page = x / self.frame.size.width;
    _currentPage = page;
    
    if (x >= (_datas.count -1 ) * self.frame.size.width) {
        _currentPage = 1;
        scrollView.contentOffset = CGPointMake(self.frame.size.width, 0);
    }
    
    if (x <= 0) {
        _currentPage = self.datas.count - 2;
        scrollView.contentOffset = CGPointMake(self.frame.size.width * (self.datas.count -2), 0);
    }
}

@end
