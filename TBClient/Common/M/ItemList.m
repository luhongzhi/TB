//
//  ItemList.m
//  TBClient
//
//  Created by Beny on 13-3-9.
//  Copyright (c) 2013年 Beny. All rights reserved.
//

#import "ItemList.h"
#import "ItemModel.h"

@interface ItemList()

@property (nonatomic,assign) NSInteger pageNo;//页码

@end

@implementation ItemList

#pragma mark - getter
-(NSInteger)pageNo
{
    if (_pageNo == 0) {
        _pageNo = 1;
    }
    return _pageNo;
}

//根据商品类目cid获取商品类目
-(void)getProductListFromServerByCid:(NSInteger)cid
{
    [self.tbHttpRequest getProductListByCid:cid AndPageNo:self.pageNo];
}

//获取商家的所有产品
-(void)getAllProductFromSeller
{
    [self.tbHttpRequest getAllProductFromSellerByPageNo:self.pageNo];
}

//获取数据每3个产品为一组
-(NSMutableArray *)getItemGroupAtRow:(NSInteger)row
{
    NSMutableArray *resultArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i=0; i<3; i++) {
        
        NSInteger index = row * 3 + i;
        if (index<self.list.count) {
            //NSLog(@"index%d",index);
            ItemModel *item = [self.list objectAtIndex:index];
            //NSLog(@"%@",item.title);
            [resultArray addObject:item];
        }
        else
            break;
    }
    return resultArray;
}

//获取有多少组产品
-(NSInteger)numberOfRowOfItem
{
    int count = self.list.count;
    if (count % 3 == 0) {
        return count / 3;
    }
    else
        return count / 3 + 1;
}

#pragma mark - TBHttpRequestDelegate

-(void)TBHttpRequest:(TBHttpRequest *)tbHttpRequest didFinishedGetResponeString:(NSString *)responeString
{
    NSMutableDictionary *responeData = [responeString objectFromJSONString];
    //NSLog(@"%@",responeData);
    
    if ([responeData objectForKey:@"products_get_response"]) {
        //获取实际数据
        NSMutableDictionary *products = [[[responeData objectForKey:@"products_get_response"] objectForKey:@"products"] objectForKey:@"product"];
        
        NSMutableArray *moreItemList = [[NSMutableArray alloc] initWithCapacity:0];

        for (NSMutableDictionary *item  in products) {
            //NSLog(@"%@",item);
            
            ItemModel *product = [[ItemModel alloc] init];
            product.cid = (NSInteger)[item objectForKey:@"cid"];
            product.title = [NSString stringWithFormat:@"%@",[item objectForKey:@"name"]];
            product.catName = [NSString stringWithFormat:@"%@",[item objectForKey:@"cat_name"]];
            product.picURL = [NSString stringWithFormat:@"%@",[item objectForKey:@"pic_url"]];
            product.productId = (NSInteger)[item objectForKey:@"product_id"];
            product.tsc = [NSString stringWithFormat:@"%@",[item objectForKey:@"tsc"]];
            product.price = [NSString stringWithFormat:@"%@",[item objectForKey:@"price"]];
            //NSLog(@"%@",product.picURL);
            
            [self.list addObject:product];

            if (self.pageNo > 1) {
                [moreItemList addObject:product];
            }
        }
        if (self.pageNo > 1) {
            if ([self.delegate respondsToSelector:@selector(itemListDidFinishedLoadMoreDataWithItemList:)]) {
                [self.delegate itemListDidFinishedLoadMoreDataWithItemList:moreItemList];
                
            }
        }
        else
            [self.delegate itemListDidFinishedGetData];
        
        self.pageNo++;//页码+1

    }
    

    
    //NSLog(@"%d",sellerCats.count);
    


    
    
}

-(void)TBHttpRequest:(TBHttpRequest *)tbHttpRequest didFailedGetResponeStringWithError:(NSError *)error
{
    if ([self.delegate respondsToSelector:@selector(itemListDidFailedGetData)]) {
        [self.delegate itemListDidFailedGetData];
    }
}
@end
