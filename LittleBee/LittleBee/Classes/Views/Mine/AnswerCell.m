//
//  AnswerCell.m
//  LittleBee
//
//  Created by maoge on 16/12/18.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "AnswerCell.h"
#import "Question.h"

@interface AnswerCell ()

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation AnswerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.lineView = [[UIView alloc] init];
        self.lineView.alpha = 0.5;
        self.lineView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.lineView];
        
    }
    
    return self;
}

- (void)setQuestion:(Question *)question {
    _question = question;
    
    for (int i = 0; i < question.texts.count; i++) {
        CGFloat textY = 0;
        
        for (int j = 0; j < i; j++) {
            textY += [[question everyRowHeight][j] floatValue];
        }

        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kEdgeDistance, textY, SCREEN_WIDTH - kEdgeDistance * 2, [[question everyRowHeight][i] floatValue])];
        _titleLabel.text = question.texts[i];
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_titleLabel];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.lineView.frame = CGRectMake(kEdgeDistance, 0, self.width - kEdgeDistance * 2, 1.0 / [UIScreen mainScreen].scale);
}

@end
