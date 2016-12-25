
//
//  ProductCategory.m
//  LittleBee
//
//  Created by maoge on 16/12/24.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "ProductCategory.h"
#import "Goods.h"

@implementation ProductCategory


+ (NSDictionary *)modelCustomPropertyMapper {
    return@{@"uid" :@"id"};
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    
    return @{@"products" : [Goods class]};
}
@end
