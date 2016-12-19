//
//  Question.h
//  LittleBee
//
//  Created by maoge on 16/12/18.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kEdgeDistance 20

@interface Question : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray *texts;

@property (nonatomic, strong) NSMutableArray *everyRowHeight;

@property (nonatomic, assign) CGFloat cellHeight;

+ (void)loadQuestions:(void(^)(NSArray <Question *>*))completion;

@end
