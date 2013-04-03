//
//  SellerCatList.h
//  TBClient
//
//  Created by Beny on 13-3-7.
//  Copyright (c) 2013年 Beny. All rights reserved.
//  店铺类目数据列表类

#import "DataList.h"

@protocol SellerCatListDelegate;

@interface SellerCatList : DataList<TBHttpRequestDelegate>

@property (nonatomic,strong) id delegate;

//从服务器获取数据
-(void)getSellerCatListFromSever;


@end

@protocol SellerCatListDelegate

@optional
//完成数据请求
-(void)sellerCatListDidFinishedGetData;
//数据请求失败
-(void)sellerCatListDidFailedGetData;

@end
