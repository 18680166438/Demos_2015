//
//  CircleCollectionViewCell.m
//  CircleAdvertise
//
//  Created by wanshaofa on 15/3/18.
//  Copyright (c) 2015年 enuke. All rights reserved.
//

#import "CircleCollectionViewCell.h"

@interface CircleCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
@implementation CircleCollectionViewCell

-(void)setImg:(NSString *)img{
    _img = img;
    [self setNeedsLayout];
}

- (void)awakeFromNib {
    // Initialization code
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.image = [UIImage imageNamed:_img];
}

@end
