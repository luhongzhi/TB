//
//  ItemList.h
//  TBClient
//
//  Created by Beny on 13-3-9.
//  Copyright (c) 2013年 Beny. All rights reserved.
//

#import "DataList.h"

@protocol ItemListDelegate;

@interface ItemList : DataList

@property (nonatomic,strong) id delegate;

//根据商品类目cid获取商品类目
-(void)getProductListFromServerByCid:(NSInteger)cid;

//获取商家的所有产品
-(void)getAllProductFromSeller;

//获取数据每3个产品为一组
-(NSMutableArray *)getItemGroupAtRow:(NSInteger)row;
//获取有多少组产品
-(NSInteger)numberOfRowOfItem;

@end

@protocol ItemListDelegate

@optional
//完成数据请求
-(void)itemListDidFinishedGetData;
//完成更多数据请求
-(void)itemListDidFinishedLoadMoreDataWithItemList:(NSMutableArray *)itemList;
//数据请求失败
-(void)itemListDidFailedGetData;

@end
