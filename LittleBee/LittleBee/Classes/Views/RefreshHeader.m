//
//  RefreshHeader.m
//  LittleBee
//
//  Created by maoge on 16/12/23.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "RefreshHeader.h"

@implementation RefreshHeader

- (void)prepare {
    [super prepare];
    
    self.stateLabel.hidden = NO;
    self.lastUpdatedTimeLabel.hidden = YES;
    
    [self setImages:@[[UIImage imageNamed:@"v2_pullRefresh1"]] forState:MJRefreshStateIdle];
    [self setImages:@[[UIImage imageNamed:@"v2_pullRefresh2"]] forState:MJRefreshStatePulling];
    [self setImages:@[[UIImage imageNamed:@"v2_pullRefresh1"], [UIImage imageNamed:@"v2_pullRefresh2"]] forState:MJRefreshStateRefreshing];

    [self setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [self setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [self setTitle:@"正在刷新" forState:MJRefreshStateRefreshing];
}

@end
