//
//  SuperMarketData.m
//  LittleBee
//
//  Created by maoge on 16/12/24.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "SuperMarketData.h"
#import "ProductCategory.h"
#import "Goods.h"


@implementation SuperMarketData

+ (void)loadSuperMarketData:(void (^)(id data, NSError *error))completion {
    
    NSString *urlString = kSuperMarketUrl;
    NSDictionary *params = @{@"call" : @"5"};
    
    [[NetWorkTool shareManager] POST_RequestWithUrlString:urlString parmas:params successBloock:^(id responseObject) {
        
        NSDictionary *dictData = responseObject[@"data"];
        
        SuperMarketData *source = [SuperMarketData yy_modelWithDictionary:dictData];

//        NSMutableArray *categoriesArrM = [NSMutableArray array];
//        NSMutableArray *goodArrM = [NSMutableArray array];
        for (int i = 0; i < source.categories.count; i++) {
            
            ProductCategory *category = source.categories[i];
            
            NSArray *productsArr = source.products[category.uid];
            
            NSMutableArray *arrM = [NSMutableArray array];
            for (NSDictionary *dict in productsArr) {
                Goods *goods = [Goods yy_modelWithDictionary:dict];
                [arrM addObject:goods];
            }
//            [goodArrM addObject:arrM];
//            [categoriesArrM addObject:category];
            
            category.products = arrM;
        }
        completion(source, nil);

    } failureBlock:^(NSError *error) {
        
        completion(nil, error);
    }];
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    
    return @{@"categories" : [ProductCategory class]};
}

@end
