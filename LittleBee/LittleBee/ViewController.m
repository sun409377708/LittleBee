//
//  ViewController.m
//  LittleBee
//
//  Created by maoge on 16/12/17.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "ViewController.h"
#import "NetWorkTool.h"
#import "JQTableView.h"
#import "JQCollectionView.h"
#import "JQHelpDetailController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)nextItem:(id)sender {
    
    JQHelpDetailController *vc = [[JQHelpDetailController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    
    JQCollectionView *collection = [[JQCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collection.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:collection];
    
    
    [self test4];
}

- (void)test10 {
    
    NSString *urlString = kMyAddressUrl;
    NSDictionary *paramDic = @{@"call" : @12};
    
    [self loadUrl:urlString params:paramDic];
}


- (void)test9 {
    
    NSString *urlString = kGetSystemMessageUrl;
    NSDictionary *paramDic = @{@"call" : @10};
    
    [self loadUrl:urlString params:paramDic];
}

- (void)test8 {
    
    NSString *urlString = kMyCouponsUrl;
    NSDictionary *paramDic = @{@"call" : @9};
    
    [self loadUrl:urlString params:paramDic];
}

- (void)test7 {
    
    NSString *urlString = kMyOrdersUrl;
    NSDictionary *paramDic = @{@"call" : @13};
    
    [self loadUrl:urlString params:paramDic];
}

- (void)test6 {
    
    NSString *urlString = kMpromotionResultUrl;
    NSDictionary *paramDic = @{@"call" : @8};
    
    [self loadUrl:urlString params:paramDic];
}

- (void)test5 {
    
    NSString *urlString = kSearchNewKeyworkUrl;
    NSDictionary *paramDic = @{@"call" : @6};
    
    [self loadUrl:urlString params:paramDic];
}

- (void)test4 {
    
    NSString *urlString = kSuperMarketUrl;
    NSDictionary *paramDic = @{@"call" : @5};
    
    [self loadUrl:urlString params:paramDic];
    
    
    
}

- (void)test3 {
    
    NSString *urlString = kAdvertisementUrl;
    NSDictionary *paramDic = @{@"call" : @7};
    
    [self loadUrl:urlString params:paramDic];
}

- (void)test2 {
    
    NSString *urlString = kFreshHotSaleUrl;
    NSDictionary *paramDic = @{@"call" : @2};
    
    [self loadUrl:urlString params:paramDic];
}

- (void)test1 {
    
    NSString *urlString = kHomePageUrl;
    NSDictionary *paramDic = @{@"call" : @1};
    
    [self loadUrl:urlString params:paramDic];
}

-(void)loadUrl:(NSString *)urlString
        params:(NSDictionary *)paramDic{
    
    
    [[NetWorkTool shareManager] POST_RequestWithUrlString:urlString parmas:paramDic successBloock:^(id responseObject) {
        
//        NSLog(@"responseObject = %@",responseObject);
        
//        NSLog(@"%@", responseObject[@"data"]);
        
        NSDictionary *dict = responseObject[@"data"];
        
        NSArray *cateArray = dict[@"categories"];
        
        NSDictionary *dict2 = dict[@"products"];

        NSMutableArray *arrM = [NSMutableArray array];
        
        for (NSDictionary *dict in cateArray) {
            NSString *idstr = dict[@"id"];
            
            NSArray *array = dict2[idstr];
            
            [arrM addObject:array];
        }
        
//        NSLog(@"%ld", arrM.count);
        
        
        for (NSArray *arr in arrM) {
            NSLog(@"%@", arr);
        }
        
        
    } failureBlock:^(NSError *error) {
        
        NSLog(@"错误%@", error);
    }];
}

@end
