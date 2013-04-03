//
//  HBTableView.h
//  TBClient
//
//  Created by Beny on 13-3-10.
//  Copyright (c) 2013年 Beny. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HBTableViewDelegate;
@protocol HBTableViewDatasource;
@class LoadMoreDataCell;

@interface HBTableView : UIView

@property (nonatomic,strong) id delegate;
@property (nonatomic,strong) id dataSource;

-(UITableViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;
- (void)insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;
//重新加载数据
-(void)reloadData;
@end

@protocol HBTableViewDatasource
@required
//有多少行数据
- (NSInteger)hbTableView:(HBTableView *)hbTableView numberOfRowsInSection:(NSInteger)section;
//每行里面的内容
- (UITableViewCell *)hbTableView:(HBTableView *)hbtableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@optional
//每行的高度
-(CGFloat)hbTableView:(HBTableView *)hbtableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;


@end

@protocol HBTableViewDelegate
//显示更多内容
-(void)hbTableView:(HBTableView *)hbtableView didShowLoadMoreCell:(LoadMoreDataCell *)cell;

@end
