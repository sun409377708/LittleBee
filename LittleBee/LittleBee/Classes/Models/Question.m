//
//  Question.m
//  LittleBee
//
//  Created by maoge on 16/12/18.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "Question.h"

@implementation Question

- (void)setTexts:(NSArray *)texts {
    _texts = texts;
    
    CGSize maxSize = CGSizeMake(SCREEN_WIDTH - kEdgeDistance * 2, MAXFLOAT);
    
    _everyRowHeight = [NSMutableArray array];
    
    for (int i = 0; i < texts.count; i++) {
        
        NSString *str = texts[i];
        
        CGFloat rowHeight = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height + 14;
        
        self.cellHeight += rowHeight;
        [self.everyRowHeight addObject:@(rowHeight)];
    }
}

+ (void)loadQuestions:(void (^)(NSArray <Question *>*))completion {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HelpPlist" ofType:@"plist"];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:path];

    NSArray *result = [NSArray yy_modelArrayWithClass:[self class] json:array];
    
    completion(result.copy);
}

@end
