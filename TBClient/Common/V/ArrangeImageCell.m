//
//  ArrangeImageCell.m
//  TBClient
//
//  Created by KeSunshine on 13-3-7.
//  Copyright (c) 2013年 Beny. All rights reserved.
//

#import "ArrangeImageCell.h"
#import "SDImageView+SDWebCache.h"
#import "ItemModel.h"
#import "CustomImageView.h"


@interface ArrangeImageCell()

@property (nonatomic, strong) CustomImageView *customImageView0;
@property (nonatomic, strong) CustomImageView *customImageView1;
@property (nonatomic, strong) CustomImageView *customImageView2;

@end

@implementation ArrangeImageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //NSLog(@"init");
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.customImageView0 = [[CustomImageView alloc] initWithFrame:CGRectMake(0, 0, 106.5, 130)];
        self.customImageView0.hidden = YES;
        //self.customImageView0.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:self.customImageView0];
        
        self.customImageView1 = [[CustomImageView alloc] initWithFrame:CGRectMake(107, 0, 106.5, 130)];
        self.customImageView1.hidden = YES;
        //self.customImageView1.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.customImageView1];
        
        self.customImageView2 = [[CustomImageView alloc] initWithFrame:CGRectMake(214, 0, 106.5, 130)];
        self.customImageView2.hidden = YES;
        //self.customImageView2.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.customImageView2];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCellContentWithArray:(NSMutableArray *)array
{
    //NSLog(@"%d",array.count);
    if ([array objectAtIndex:0]) {
        ItemModel *itemModel = [[ItemModel alloc] init];
        itemModel = [array objectAtIndex:0];
        NSURL *imageURL = [NSURL URLWithString:itemModel.picURL];
        self.customImageView0.hidden = NO;
        self.customImageView0.shadowImageView.hidden = NO;
        self.customImageView0.downloadImageView.hidden = NO;
        [self.customImageView0.imageView setImageWithURL:imageURL];
        self.customImageView0.titleLabel.text = itemModel.title;
        self.customImageView0.priceLabel.text = itemModel.price;
    }
    
    if (array.count >= 2) {
        ItemModel *itemModel = [[ItemModel alloc] init];
        itemModel = [array objectAtIndex:1];
        NSURL *imageURL = [NSURL URLWithString:itemModel.picURL];
        self.customImageView1.hidden = NO;
        self.customImageView1.shadowImageView.hidden = NO;
        self.customImageView1.downloadImageView.hidden = NO;
        [self.customImageView1.imageView setImageWithURL:imageURL];
        self.customImageView1.titleLabel.text = itemModel.title;
        self.customImageView1.priceLabel.text = itemModel.price;
    }
    
    if (array.count == 3) {
        ItemModel *itemModel = [[ItemModel alloc] init];
        itemModel = [array objectAtIndex:2];
        NSURL *imageURL = [NSURL URLWithString:itemModel.picURL];
        self.customImageView2.hidden = NO;
        self.customImageView2.shadowImageView.hidden = NO;
        self.customImageView2.downloadImageView.hidden = NO;
        [self.customImageView2.imageView setImageWithURL:imageURL];
        self.customImageView2.titleLabel.text = itemModel.title;
        self.customImageView2.priceLabel.text = itemModel.price;
    }
    
    //NSLog(@"%@",self.contentView.subviews);
}

@end
