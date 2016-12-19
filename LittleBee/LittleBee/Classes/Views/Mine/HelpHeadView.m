//
//  HelpHeadView.m
//  LittleBee
//
//  Created by maoge on 16/12/18.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "HelpHeadView.h"
#import "Question.h"

@implementation HelpHeadView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _questionLabel = [[UILabel alloc] init];
        _questionLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_questionLabel];
        
        _arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_arrow_down_accessory"]];
        [self.contentView addSubview:_arrowImageView];
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headViewDidClick:)];
        [self.contentView addGestureRecognizer:tap];
        
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_lineView];
    }
    
    return self;
}

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
        if (isSelected) {
        _arrowImageView.transform = CGAffineTransformMakeRotation(M_PI);
    }else  {
        _arrowImageView.transform = CGAffineTransformIdentity;
    }
}

- (void)setQuestion:(Question *)question {
    _question = question;
    
    self.questionLabel.text = question.title;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _questionLabel.frame = CGRectMake(kEdgeDistance, 0, self.width - kEdgeDistance, self.height);
    
    _arrowImageView.frame = CGRectMake(self.width - 30, (self.height - _arrowImageView.height) * 0.5 , _arrowImageView.width, _arrowImageView.height);
    ;
    _lineView.frame = CGRectMake(0, 0, self.width, 1);
}

- (void)headViewDidClick:(UITapGestureRecognizer *)recognizer {
    self.isSelected = !self.isSelected;

    if ([self.delegate respondsToSelector:@selector(headerViewClick:)]) {
        
        [self.delegate headerViewClick:self];
    }
}


@end
