//
//  HomeHeadView.h
//  LittleBee
//
//  Created by maoge on 16/12/20.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotView.h"


@interface HomeHeadView : UIView
/** headView自身高度*/
@property (nonatomic, assign) CGFloat headViewHeight;

/** 轮播器视图*/
@property (nonatomic, weak) UIView *pageView;

/** 热点按钮视图*/
@property (nonatomic, weak) HotView *hotView;
@end
