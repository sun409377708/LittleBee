//
//  MainTabController.m
//  LittleBee
//
//  Created by maoge on 16/12/19.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "MainTabController.h"
#import "MainNavController.h"

@interface MainTabController ()

@end

@implementation MainTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 实例化一个可变数组
    NSMutableArray *mutable = [NSMutableArray array];
    
    // 2. 添加
    [mutable addObject:[self addChildControllerWith:@"HomeViewController" title:@"首页" normalImage:@"v2_home"]];
    [mutable addObject:[self addChildControllerWith:@"FlashViewController" title:@"闪电超市" normalImage:@"v2_order"]];
    [mutable addObject:[self addChildControllerWith:@"ShoppingCardController" title:@"购物车" normalImage:@"shopCart"]];
    [mutable addObject:[self addChildControllerWith:@"MineViewController" title:@"我的" normalImage:@"v2_my"]];
    
    // 3. 赋值
    self.viewControllers = mutable;
    
}

- (UIViewController *)addChildControllerWith:(NSString *)clsName title:(NSString *)title normalImage:(NSString *)normalImage {
    // 1. 把字符串转为class
    Class cls = NSClassFromString(clsName);
    
    // 2. 实例化控制器
    UIViewController *controller = [[cls alloc] init];
    
    // 3. 设置控制器的属性
    // 3.1 设置title
    controller.tabBarItem.title = title;
    controller.navigationItem.title = title;
    
    // 3.2 设置普通状态的image
    controller.tabBarItem.image = [UIImage imageNamed:normalImage];
    
    // 3.3 设置选中的图片
    NSString *selName = [normalImage stringByAppendingString:@"_r"];
    
    UIImage *selImage = [[UIImage imageNamed:selName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    controller.tabBarItem.selectedImage = selImage;
    
    // 3.4 643205 设置选中状态的文字的颜色
    [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor jq_colorWithHex:0xfbd633]} forState:UIControlStateSelected];
    
    // 4. 实例化导航控制器
    MainNavController *nav = [[MainNavController alloc] initWithRootViewController:controller];
    
    return nav;
    
}

@end
