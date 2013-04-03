//
//  ProductListViewController.m
//  TBClient
//
//  Created by Beny on 13-3-9.
//  Copyright (c) 2013年 Beny. All rights reserved.
//

#import "ProductListViewController.h"
#import "ItemList.h"

@interface ProductListViewController ()

@property (nonatomic,strong) ItemList *itemList;//商品数据源

@end

@implementation ProductListViewController

#pragma mark - Init
-(ItemList *)itemList
{
    if (!_itemList) {
        _itemList = [[ItemList alloc] init];
        _itemList.delegate = self;
    }
    return _itemList;
}

//进行数据请求
-(void)getItemListFromServerByCid:(NSInteger)cid
{
    [self.itemList getAllProductFromSeller];
    
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
