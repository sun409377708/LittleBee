//
//  HelpHeadView.h
//  LittleBee
//
//  Created by maoge on 16/12/18.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Question;
@class HelpHeadView;

@protocol HelpHeadViewDelegate <NSObject>

- (void)headerViewClick:(HelpHeadView *)headView;

@end

@interface HelpHeadView : UITableViewHeaderFooterView

@property (nonatomic, strong) Question *question;

@property (nonatomic, weak) id<HelpHeadViewDelegate> delegate;

@property (nonatomic, strong) UILabel *questionLabel;

@property (nonatomic, strong) UIImageView *arrowImageView;

@property (nonatomic, assign) BOOL isSelected;

@property (nonatomic, strong) UIView *lineView;


@end
