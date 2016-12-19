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
    
    CGSize maxSize = CGSizeMake(SCREEN_WIDTH - 40, 10000);
        
    for (int i = 0; i < texts.count; i++) {
        
        NSString *str = texts[i];
        
        CGFloat rowHeight = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height + 14;
        
//        NSLog(@"%@", str);
        self.cellHeight += rowHeight;
        [self.everyRowHeight addObject:@(rowHeight)];
        
//        NSLog(@"++++%ld", self.everyRowHeight.count);
    }
}

+ (instancetype)questionWithDict:(NSDictionary *)dict {
    
    Question *question = [[Question alloc] init];
    
    question.everyRowHeight = [NSMutableArray array];
    
    question.title = [dict objectForKey:@"title"];
    question.texts = [dict objectForKey:@"texts"];

    return question;
}

+ (void)loadQuestions:(void (^)(NSArray <Question *>*))completion {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HelpPlist" ofType:@"plist"];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *arrM = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        
        [arrM addObject:[Question questionWithDict:dict]];
    }
    
    completion(arrM.copy);
}

@end
