//
//  LoadMoreDataCell.m
//  Emie
//
//  Created by heaben on 12-8-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LoadMoreDataCell.h"

@implementation LoadMoreDataCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.textAlignment = UITextAlignmentCenter;
        UIActivityIndicatorView *activeView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        activeView.center = CGPointMake(self.center.x-55, self.center.y+18);
        [self addSubview:activeView];
        [activeView startAnimating];
        self.textLabel.text = @"正在加载...";
        self.userInteractionEnabled = NO;
        self.textLabel.font = [UIFont systemFontOfSize:14.0];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
