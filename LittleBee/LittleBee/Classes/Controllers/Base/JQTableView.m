//
//  JQTableView.m
//  LittleBee
//
//  Created by maoge on 16/12/17.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "JQTableView.h"

@implementation JQTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.delaysContentTouches = NO;
        self.canCancelContentTouches = YES;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        UIView *wrapView = self.subviews.firstObject;
        
        if (wrapView != nil && [NSStringFromClass([wrapView class]) hasPrefix:@"UITableViewWrapperView"]) {
            
            for (UIGestureRecognizer *gesture in wrapView.gestureRecognizers) {
                
                if ([NSStringFromClass([gesture class]) containsString:@"UIScrollViewDelayedTouchesBeganGestureRecognizer"]) {
                    
                    gesture.enabled = false;
                    break;
                }
            }
        }
    }
    
    return self;
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
    
    if ([view isKindOfClass:[UIControl class]]) {
        return true;
    }
    
    return  [super touchesShouldCancelInContentView:view];
}

@end
