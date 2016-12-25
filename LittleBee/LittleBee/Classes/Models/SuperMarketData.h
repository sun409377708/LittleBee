//
//  SuperMarketData.h
//  LittleBee
//
//  Created by maoge on 16/12/24.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ProductCategory;

@interface SuperMarketData : NSObject

@property (nonatomic, strong) id products;

@property (nonatomic, strong) NSArray<ProductCategory *> *categories;

+ (void)loadSuperMarketData:(void (^)(id data, NSError *error))completion;
@end
