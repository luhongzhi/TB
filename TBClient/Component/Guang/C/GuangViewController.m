//
//  GuangViewController.m
//  TBClient
//
//  Created by Beny on 13-3-6.
//  Copyright (c) 2013年 Beny. All rights reserved.
//

#import "GuangViewController.h"
#import "ItemList.h"
#import "HBTableView.h"
#import "ArrangeImageCell.h"

@interface GuangViewController ()<HBTableViewDatasource,HBTableViewDelegate,ItemListDelegate>

@property (nonatomic,strong) ItemList *itemList;//商品数据源
@property (nonatomic,strong) HBTableView *tableView;//表视图
@property (nonatomic,assign) BOOL isLoadingData;//是否正在执行请求

@end

@implementation GuangViewController
#pragma mark - Init
-(ItemList *)itemList
{
    if (!_itemList) {
        _itemList = [[ItemList alloc] init];
        _itemList.delegate = self;
    }
    return _itemList;
}

-(HBTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[HBTableView alloc] initWithFrame:CGRectMake(0, 0, 320, 368)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

#pragma mark - ViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.itemList getAllProductFromSeller];
    self.isLoadingData = YES;
    [self.view addSubview:self.tableView];
    [self showLoadingProgressHUD];

    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - HBTableViewDatasource
//有多少行数据
- (NSInteger)hbTableView:(HBTableView *)hbTableView numberOfRowsInSection:(NSInteger)section
{
    return [self.itemList numberOfRowOfItem];
}
//每行里面的内容
- (UITableViewCell *)hbTableView:(HBTableView *)hbtableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *arrangeImageCellIdentifier = @"ArrangeImageCellIdentifier";
    ArrangeImageCell *cell = (ArrangeImageCell *)[hbtableView dequeueReusableCellWithIdentifier:arrangeImageCellIdentifier];
    
    if (cell == nil) {
        cell = [[ArrangeImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:arrangeImageCellIdentifier];
    }
    
    [cell setCellContentWithArray:[self.itemList getItemGroupAtRow:indexPath.row]];
    //NSLog(@"%@",[self.itemArray objectAtIndex:indexPath.row]);
    return cell;
    
}
//每行的高度
-(CGFloat)hbTableView:(HBTableView *)hbtableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [self.itemList numberOfRowOfItem]) {
        return 80;
    }
    return 131;
}

-(void)appendTableWith:(NSMutableArray *)data
{
    
    NSMutableArray *insertIndexPaths = [NSMutableArray arrayWithCapacity:0];
    for (int ind = 0; ind < [data count]; ind++) {
        NSIndexPath    *newPath =  [NSIndexPath indexPathForRow:[self.itemList.list indexOfObject:[data objectAtIndex:ind]] inSection:0];
        [insertIndexPaths addObject:newPath];
    }
    [self.tableView insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationFade];
    
    NSLog(@"%@",insertIndexPaths);
}


#pragma mark - HBTableViewDelegate
//显示更多内容
-(void)hbTableView:(HBTableView *)hbtableView didShowLoadMoreCell:(LoadMoreDataCell *)cell
{
    if (self.isLoadingData == NO) {
        [self.itemList getAllProductFromSeller];
        NSLog(@"加载更多");
        self.isLoadingData = YES;
    }

}

#pragma mark - ItemListDelegate
//完成数据请求
-(void)itemListDidFinishedGetData
{
    self.isLoadingData = NO;
    [self.tableView reloadData];
    [self stopLoadingProGressHUD];
}
//数据请求失败
-(void)itemListDidFailedGetData
{
    self.isLoadingData = NO;

}

-(void)itemListDidFinishedLoadMoreDataWithItemList:(NSMutableArray *)itemList
{
    self.isLoadingData = NO;
    [self stopLoadingProGressHUD];
    [self appendTableWith:itemList];


}

@end
