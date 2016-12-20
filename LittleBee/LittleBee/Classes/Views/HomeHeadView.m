
//
//  HomeHeadView.m
//  LittleBee
//
//  Created by maoge on 16/12/20.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "HomeHeadView.h"

NSString * const HomeHeadViewHeightDidChange = @"HomeHeadViewHeightDidChange";


@implementation HomeHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    UIView *pageView = [[UIView alloc] initWithFrame:CGRectZero];
    _pageView = pageView;
    [self addSubview:pageView];
    
    [_pageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.top.equalTo(self);
        make.height.equalTo(self.mas_width).multipliedBy(0.31);
    }];
    
    HotView *hotView = [[HotView alloc] initWithImages:@[] title:@[] placeHolder:[UIImage imageNamed:@"icon_icons_holder"]];
    _hotView = hotView;
    [self addSubview:hotView];
    
    [hotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self);
        make.top.equalTo(_pageView.mas_bottom);
        make.height.mas_equalTo(hotView.bounds.size.height);
    }];
}

- (void)setHeadViewHeight:(CGFloat)headViewHeight {
    _headViewHeight = headViewHeight;
    //发送通知给Home控制器
    [[NSNotificationCenter defaultCenter] postNotificationName:HomeHeadViewHeightDidChange object:@(headViewHeight)];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.headViewHeight = CGRectGetMaxY(_hotView.frame);
}

@end
