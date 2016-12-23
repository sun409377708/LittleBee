//
//  HotView.m
//  LittleBee
//
//  Created by maoge on 16/12/20.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "HotView.h"
const CGFloat DefaultMargin = 10;

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
    NSInteger count = 8;
    
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
    NSInteger column = 4;

    CGFloat iconW = (SCREEN_WIDTH - 2 * DefaultMargin) / column;
    CGFloat iconH = iconW * 0.68 + 20;
    
    for (int i = 0; i < _btnArray.count; i++) {
        UIButton *btn = _btnArray[i];
        
        // column row index
        CGFloat row = i / column;
        CGFloat col = i % column;
        
        CGFloat iconX = col * iconW + DefaultMargin;
        CGFloat iconY = row * iconH;
        
        btn.frame = CGRectMake(iconX, iconY, iconW, iconH);
    }
    self.bounds = CGRectMake(0, 0, SCREEN_WIDTH, (_btnArray.count/ column) * iconH);

    
//    CGSize screenSize = self.bounds.size;
//    
//    NSInteger count = _btnArray.count;
//    
//    CGFloat btnWidth = screenSize.width / count;
//    
//    CGFloat btnHeight = screenSize.height;
//    
//    for (NSInteger i = 0; i < count; i++) {
//        
//        UIButton *btn = _btnArray[i];
//        
//        btn.frame = CGRectMake(i * btnWidth, 0, btnWidth, btnHeight);
//    }
//    
}


@end
