//
//  CatalogViewController.m
//  TBClient
//
//  Created by Beny on 13-3-6.
//  Copyright (c) 2013年 Beny. All rights reserved.
//

#import "CatalogViewController.h"
#import "SellerCatList.h"
#import "SellerCatCell.h"
#import "ProductListViewController.h"

@interface CatalogViewController ()<UITabBarControllerDelegate,UITableViewDataSource,UITableViewDelegate,SellerCatListDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;//表格视图
@property (nonatomic,strong) SellerCatList *sellerCatList;//类目数据列表

@end

@implementation CatalogViewController

#pragma mark - Init
-(SellerCatList *)sellerCatList
{
    if (!_sellerCatList) {
        _sellerCatList = [[SellerCatList alloc] init];
        _sellerCatList.delegate = self;
    }
    return _sellerCatList;
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
	// Do any additional setup after loading the view.
    
    [self.sellerCatList getSellerCatListFromSever];
    [self showLoadingProgressHUD];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%d",self.sellerCatList.list.count);
    return self.sellerCatList.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    SellerCatCell *cell = [tableView dequeueReusableCellWithIdentifier: SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[SellerCatCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:SimpleTableIdentifier]; }
    //cell.textLabel.text = @"1";
    
    [cell setDataBySellerCat:[self.sellerCatList.list objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SellerCatCell *cell = (SellerCatCell *)[tableView cellForRowAtIndexPath:indexPath];
  
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    ProductListViewController *productListVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"ProductList"];
    [productListVC getItemListFromServerByCid:[cell getCidFromSellerCat]];
    [self.navigationController pushViewController:productListVC animated:YES];
    
}


#pragma mark - SellerCatListDelegate
-(void)sellerCatListDidFinishedGetData
{
    NSLog(@"1");
    [self.tableView reloadData];
    [self stopLoadingProGressHUD];
}

-(void)sellerCatListDidFailedGetData
{
    [self stopLoadingProGressHUD];

}


@end
