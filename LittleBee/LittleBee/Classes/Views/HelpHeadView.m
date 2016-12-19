//
//  HelpHeadView.m
//  LittleBee
//
//  Created by maoge on 16/12/18.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "HelpHeadView.h"
#import "Question.h"

@interface HelpHeadView ()



@end

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
        _lineView.backgroundColor = [UIColor blackColor];
        [self.contentView addSubview:_lineView];
    }
    
    return self;
}

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    
    if (isSelected) {
        _arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_arrow_up_accessory"]];
    }else {
        _arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_arrow_down_accessory"]];

    }
}

- (void)setQuestion:(Question *)question {
    _question = question;
    
    self.questionLabel.text = question.title;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _questionLabel.frame = CGRectMake(20, 0, self.bounds.size.width - 20, self.bounds.size.height);
    
    _arrowImageView.frame = CGRectMake(self.bounds.size.width - 30, (self.bounds.size.height - _arrowImageView.bounds.size.height) * 0.5 , _arrowImageView.bounds.size.width, _arrowImageView.bounds.size.height);
    
    _lineView.frame = CGRectMake(0, 0, self.bounds.size.width, 1);
}

- (void)headViewDidClick:(UITapGestureRecognizer *)recognizer {
    self.isSelected = !self.isSelected;

    if ([self.delegate respondsToSelector:@selector(headerViewClick:)]) {
        
        [self.delegate headerViewClick:self];
    }
}


@end
