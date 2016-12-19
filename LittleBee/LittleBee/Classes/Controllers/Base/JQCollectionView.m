//
//  JQCollectionView.m
//  LittleBee
//
//  Created by maoge on 16/12/17.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "JQCollectionView.h"

@implementation JQCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        //若想要让 短按长按均可显示高亮特效的话, 就是去掉这个延迟。 在你创建完表视图对象的地方, 或其初始化方法中加入以下代码, 将其默认的值改为 NO
        self.delaysContentTouches = NO;
        self.canCancelContentTouches = YES;
        
        UIView *wrapView = self.subviews.firstObject;
        
        if (wrapView != nil && [NSStringFromClass([wrapView class]) hasPrefix:@"UICollectionViewWrapperView"]) {
            
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

//即使触摸到的是一个 UIControl (如子类：UIButton), 我们也希望拖动时能取消掉动作以便响应滚动动作
- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
    
    if ([view isKindOfClass:[UIControl class]]) {
        return true;
    }
    
    return  [super touchesShouldCancelInContentView:view];
}

@end
