//
//  TBHttpRequest.m
//  TBClient
//
//  Created by Beny on 13-3-6.
//  Copyright (c) 2013年 Beny. All rights reserved.
//

#import "TBHttpRequest.h"
#import "Config.h"
#import "TopSDKBundle.h"
#import "TopAppService.h"
#import "TopAppConnector.h"

@implementation TBHttpRequest

//把请求字符串转换为参数格式
-(NSMutableDictionary *)getParamByRequestString:(NSString *)requestString
{
    if (requestString && [requestString length] > 0)
    {
        NSLog(@"处理参数");
        
        NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
        
        NSEnumerator *er = [[requestString componentsSeparatedByString:@"&"] objectEnumerator];
        
        id anObject;
        
        while (anObject = [er nextObject]) {
            
            NSArray *arr = [(NSString *)anObject componentsSeparatedByString:@"="];
            
            if ([arr count] != 2)
            {
                continue;
            }
            
            [params setObject:[arr objectAtIndex:1] forKey:[arr objectAtIndex:0]];
        }
        return params;
    }
    else {
        NSLog(@"参数错误");
        return nil;
    }
}

//获取前台展示的店铺内卖家自定义商品类目
-(void)getSellerCatsList
{
    NSString *requestStr = [NSString stringWithFormat:@"method=taobao.sellercats.list.get&nick=%@",TBNICK];//请求参数
    
    NSMutableDictionary *params = [self getParamByRequestString:requestStr];//处理参数
    
    //发送请求
    TopIOSClient *iosClient =[TopIOSClient getIOSClientByAppKey:TBAPPKEY];
    [iosClient api:@"GET" params:params target:self cb:@selector(showApiResponse:) userId:nil needMainThreadCallBack:true];
    
}

//根据商品类目cid获取商品类目
-(void)getProductListByCid:(NSInteger)cid AndPageNo:(NSInteger)pageNo
{
    NSLog(@"%dcid=",cid);
    NSString *requestStr = [NSString stringWithFormat:@"method=taobao.products.search&fields=product_id,name,pic_url,cid,props,price,tsc&cid=%d&page_no=%d&page_size=%d",cid,pageNo,PAGESIZE];//请求参数
    
    NSMutableDictionary *params = [self getParamByRequestString:requestStr];//处理参数
    
    //发送请求
    TopIOSClient *iosClient =[TopIOSClient getIOSClientByAppKey:TBAPPKEY];
    [iosClient api:@"GET" params:params target:self cb:@selector(showApiResponse:) userId:nil needMainThreadCallBack:true];
    
}

//获取商家的所有产品
-(void)getAllProductFromSellerByPageNo:(NSInteger)pageNo
{
    NSString *requestStr = [NSString stringWithFormat:@"method=taobao.products.get&fields=product_id,tsc,cat_name,name,cid,pic_url,price,product_imgs&nick=%@&page_no=%d&page_size=%d",TBNICK,pageNo,PAGESIZE];//请求参数
    
    NSMutableDictionary *params = [self getParamByRequestString:requestStr];//处理参数
    
    //发送请求
    TopIOSClient *iosClient =[TopIOSClient getIOSClientByAppKey:TBAPPKEY];
    [iosClient api:@"GET" params:params target:self cb:@selector(showApiResponse:) userId:nil needMainThreadCallBack:true];
    
}

//请求结果回调
-(void)showApiResponse:(id)data
{
    //NSLog(@"结果回调");
    
    if ([data isKindOfClass:[TopApiResponse class]])
    {
        TopApiResponse *response = (TopApiResponse *)data;
        //请求成功
        if ([response content])
        {
            //NSLog(@"%@",[response content]);
            if ([self.delegate respondsToSelector:@selector(TBHttpRequest:didFinishedGetResponeString:)]) {
                [self.delegate TBHttpRequest:self didFinishedGetResponeString:[response content]];
            }
        }
        //请求失败
        else {
            NSLog(@"%@",[(NSError *)[response error] localizedDescription]);
            if ([[[response error] localizedDescription] isEqualToString:@"The Internet connection appears to be offline."]) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"网络错误" message:@"似乎已经断开网络连接" delegate:nil cancelButtonTitle:@"明白了" otherButtonTitles:nil, nil];
                [alert show];
            }
            //NSLog(@"网络连接有问题");
            if ([self.delegate respondsToSelector:@selector(TBHttpRequest:didFailedGetResponeStringWithError:)]) {
                [self.delegate TBHttpRequest:self didFailedGetResponeStringWithError:(NSError *)[response error]];
            }
        }
        /*
         NSDictionary *dictionary = (NSDictionary *)[response reqParams];
         
         for (id key in dictionary) {
         
         NSLog(@"key: %@, value: %@", key, [dictionary objectForKey:key]);
         
         }
         */
    }
    
}


@end
