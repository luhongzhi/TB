//
//  HBTableView.m
//  TBClient
//
//  Created by Beny on 13-3-10.
//  Copyright (c) 2013年 Beny. All rights reserved.
//  

#import "HBTableView.h"
#import "LoadMoreDataCell.h"

@interface HBTableView()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation HBTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //self.backgroundColor = [UIColor blackColor];
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 368)];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:self.tableView];
    }
    return self;
}

-(UITableViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier
{
    return [self.tableView dequeueReusableCellWithIdentifier:identifier];
}

- (void)insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:animation];

}

//重新加载数据
-(void)reloadData
{
    [self.tableView reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = [self.dataSource hbTableView:self numberOfRowsInSection:section];
    if (count == 0) {
        return 0;
    }
    else
        return [self.dataSource hbTableView:self numberOfRowsInSection:section] + 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.dataSource respondsToSelector:@selector(hbTableView:heightForRowAtIndexPath:)]) {
        return [self.dataSource hbTableView:self heightForRowAtIndexPath:indexPath];
    }
    else
        return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row+1 == [self.tableView numberOfRowsInSection:0]) {
        LoadMoreDataCell *cell = nil;
        cell = [[LoadMoreDataCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:nil];
        
        if ([self.delegate respondsToSelector:@selector(hbTableView:didShowLoadMoreCell:)]) {
            [self.delegate hbTableView:self didShowLoadMoreCell:cell];
        }
        
        return cell;
    }
    else
        return [self.dataSource hbTableView:self cellForRowAtIndexPath:indexPath];
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    /*
    SellerCatCell *cell = (SellerCatCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    ProductListViewController *productListVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"ProductList"];
    [productListVC getItemListFromServerByCid:[cell getCidFromSellerCat]];
    [self.navigationController pushViewController:productListVC animated:YES];
    */
}



@end
