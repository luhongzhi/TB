//
//  SellerCatModel.h
//  TBClient
//
//  Created by Beny on 13-3-7.
//  Copyright (c) 2013年 Beny. All rights reserved.
//  类目模型类

#import "Model.h"

@interface SellerCatModel : Model
@property (nonatomic,strong) NSString *type;    //店铺类目类型
@property (nonatomic,assign) NSInteger cid;     //卖家自定义类目编号
@property (nonatomic,assign) NSInteger parentCid;//父类目编号
@property (nonatomic,strong) NSString *name;    //卖家自定义类目名称
@property (nonatomic,strong) NSString *picUrl;  //链接图片地址
@property (nonatomic,assign) NSInteger sortOrder;//该类目在页面上的排序位置

@property (nonatomic,strong) NSMutableArray *subCatList;//子分类列表

@end
