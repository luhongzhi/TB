//
//  CustomImageView.m
//  TBClient
//
//  Created by KeSunshine on 13-3-9.
//  Copyright (c) 2013年 Beny. All rights reserved.
//

#import "CustomImageView.h"

@implementation CustomImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //初始化阴影图片
        self.shadowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 86.5, 86.5)];
        self.shadowImageView.image = [UIImage imageNamed:@"shadow.png"];
        self.shadowImageView.hidden = YES;
        [self addSubview:self.shadowImageView];
        
        //初始化下载图片
        self.downloadImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 86.5, 86.5)];
        self.downloadImageView.image = [UIImage imageNamed:@"download.png"];
        self.downloadImageView.hidden = YES;
        [self addSubview:self.downloadImageView];
        
        //初始化图片
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 86.5, 86.5)];
        [self addSubview:self.imageView];
        
        //初始化标题
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 86.5, 10)];
        self.titleLabel.textAlignment = UITextAlignmentCenter;
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        [self addSubview:self.titleLabel];
        
        //初始化价格
        self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, 86.5, 10)];
        self.priceLabel.textAlignment = UITextAlignmentCenter;
        self.priceLabel.textColor = [UIColor redColor];
        self.priceLabel.backgroundColor = [UIColor clearColor];
        self.priceLabel.font = [UIFont systemFontOfSize:10];
        [self addSubview:self.priceLabel];

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
