//
//  SellerCatCell.m
//  TBClient
//
//  Created by Beny on 13-3-8.
//  Copyright (c) 2013年 Beny. All rights reserved.
//

#import "SellerCatCell.h"
#import "SellerCatModel.h"

@interface SellerCatCell()

@property (nonatomic,strong) UILabel *titleLabel;//标题
@property (nonatomic,strong) SellerCatModel *sellerCat;//数据模型

@end

@implementation SellerCatCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 160, 44)];
        self.titleLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//设置cell的数据
-(void)setDataBySellerCat:(SellerCatModel *)sellerCat
{
    self.sellerCat = sellerCat;
    self.titleLabel.text = sellerCat.name;
}

//获取目录cid
-(NSInteger)getCidFromSellerCat
{
    return self.sellerCat.cid;
}

@end
