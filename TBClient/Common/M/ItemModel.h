//
//  ItemModel.h
//  TBClient
//
//  Created by Beny on 13-3-7.
//  Copyright (c) 2013年 Beny. All rights reserved.
//  商品类

#import "Model.h"

@interface ItemModel : Model
@property (nonatomic, strong) NSString *picURL; //商品图片链接
@property (nonatomic, strong) NSString *numIID; //商品数字id
@property (nonatomic, strong) NSString *title;  //商品标题
@property (nonatomic, strong) NSString *price;  //商品价格
@property (nonatomic, assign) NSInteger cid;//商品类目ID
@property (nonatomic, assign) NSInteger *productId;//产品ID
@property (nonatomic, strong) NSString *catName;//商品类目名称
@property (nonatomic, strong) NSString *tsc;//淘宝标准产品编码

@end
