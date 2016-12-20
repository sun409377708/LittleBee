//
//  HotView.m
//  LittleBee
//
//  Created by maoge on 16/12/20.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "HotView.h"

@interface HotView()

@property (nonatomic, strong) NSArray *btnArray;
@end

@implementation HotView

- (instancetype)initWithImages:(NSArray *)images title:(NSArray *)titles placeHolder:(UIImage *)image {
    
    if (self = [super init]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    //添加4个按钮
    NSInteger count = 4;
    
    NSMutableArray *arrM = [NSMutableArray array];
    
    for (NSInteger i = 0; i < count; i++) {
        UIButton *btn = [[UIButton alloc] init];
        
        UIImage *image = [UIImage imageNamed:@"v2_my_message_empty"];
        
        NSAttributedString *attStr = [NSAttributedString imageTextWithImage:image imageWH:43 title:@"扫一扫" fontSize:15 titleColor:[UIColor whiteColor] spacing:7];
        
        [btn setAttributedTitle:attStr forState:UIControlStateNormal];
        
        btn.titleLabel.numberOfLines = 0;
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [btn sizeToFit];
        
        [self addSubview:btn];
        
        [arrM addObject:btn];
        
        [btn setTag:i];
        
        [btn addTarget:self action:@selector(favoriteViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    _btnArray = arrM.copy;
}

//实现点击方法
- (void)favoriteViewClick:(UIButton *)sender {
    NSLog(@"按钮点击%ld", sender.tag);
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize screenSize = self.bounds.size;
    
    NSInteger count = _btnArray.count;
    
    CGFloat btnWidth = screenSize.width / count;
    
    CGFloat btnHeight = screenSize.height;
    
    for (NSInteger i = 0; i < count; i++) {
        
        UIButton *btn = _btnArray[i];
        
        btn.frame = CGRectMake(i * btnWidth, 0, btnWidth, btnHeight);
    }
    
}


@end
