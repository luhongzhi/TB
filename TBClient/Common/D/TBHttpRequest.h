//
//  TBHttpRequest.h
//  TBClient
//
//  Created by Beny on 13-3-6.
//  Copyright (c) 2013年 Beny. All rights reserved.
//  淘宝数据请求类

#import <Foundation/Foundation.h>

@protocol TBHttpRequestDelegate;

@interface TBHttpRequest : NSObject

@property (nonatomic,strong) id delegate;

//获取前台展示的店铺内卖家自定义商品类目
-(void)getSellerCatsList;
//根据商品类目cid获取商品类目
-(void)getProductListByCid:(NSInteger)cid AndPageNo:(NSInteger)pageNo;
//获取商家的所有产品
-(void)getAllProductFromSellerByPageNo:(NSInteger)pageNo;
@end

@protocol TBHttpRequestDelegate

@required
//完成数据请求后委托调用此函数
-(void)TBHttpRequest:(TBHttpRequest *)tbHttpRequest didFinishedGetResponeString:(NSString *)responeString;
//当数据请求失败后委托调用此函数
-(void)TBHttpRequest:(TBHttpRequest *)tbHttpRequest didFailedGetResponeStringWithError:(NSError *)error;

@end