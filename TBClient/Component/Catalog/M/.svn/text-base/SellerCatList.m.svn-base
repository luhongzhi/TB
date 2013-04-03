//
//  SellerCatList.m
//  TBClient
//
//  Created by Beny on 13-3-7.
//  Copyright (c) 2013年 Beny. All rights reserved.
//

#import "SellerCatList.h"
#import "SellerCatModel.h"

@implementation SellerCatList

#pragma mark - Public Methods

//从服务器获取数据
-(void)getSellerCatListFromSever
{
    [self.tbHttpRequest getSellerCatsList];
}


#pragma mark - TBHttpRequestDelegate

-(void)TBHttpRequest:(TBHttpRequest *)tbHttpRequest didFinishedGetResponeString:(NSString *)responeString
{
    NSMutableDictionary *responeData = [responeString objectFromJSONString];
    NSLog(@"%@",responeData);
    
    //获取实际数据
    NSMutableDictionary *sellerCats = [[[responeData objectForKey:@"sellercats_list_get_response"] objectForKey:@"seller_cats"] objectForKey:@"seller_cat"];

    //NSLog(@"%d",sellerCats.count);
    
    for (NSMutableDictionary *item  in sellerCats) {
        //NSLog(@"%@",item);
        
        SellerCatModel *sellerCat = [[SellerCatModel alloc] init];
        sellerCat.cid = (NSInteger)[item objectForKey:@"cid"];
        sellerCat.name = [NSString stringWithFormat:@"%@",[item objectForKey:@"name"]];
        sellerCat.parentCid = (NSInteger)[item objectForKey:@"parent_cid"];
        sellerCat.picUrl = [NSString stringWithFormat:@"%@",[item objectForKey:@"pic_url"]];
        sellerCat.type = [NSString stringWithFormat:@"%@",[item objectForKey:@"manual_type"]];
        
        [self.list addObject:sellerCat];
    }
    
    if ([self.delegate respondsToSelector:@selector(sellerCatListDidFinishedGetData)]) {
        [self.delegate sellerCatListDidFinishedGetData];
    }

}

-(void)TBHttpRequest:(TBHttpRequest *)tbHttpRequest didFailedGetResponeStringWithError:(NSError *)error
{
    if ([self.delegate respondsToSelector:@selector(sellerCatListDidFailedGetData)]) {
        [self.delegate sellerCatListDidFailedGetData];
    }
}

@end
