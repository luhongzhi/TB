//
//  DataList.m
//  DoorMobileSystem
//
//  Created by Beny on 13-1-27.
//  Copyright (c) 2013年 Beny. All rights reserved.
//

#import "DataList.h"

@implementation DataList

#pragma mark - Init
-(TBHttpRequest *)tbHttpRequest
{
    if (!_tbHttpRequest) {
        _tbHttpRequest = [[TBHttpRequest alloc] init];
        self.tbHttpRequest.delegate = self;
    }
    return _tbHttpRequest;
}

-(NSMutableArray *)list
{
    if (!_list) {
        _list = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _list;
}

//Debug Method
-(void)getListCount
{
    NSLog(@"%d",self.list.count);
}
@end
