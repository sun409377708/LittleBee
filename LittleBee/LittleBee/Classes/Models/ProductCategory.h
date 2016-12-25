//
//  ProductCategory.h
//  LittleBee
//
//  Created by maoge on 16/12/24.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductCategory : NSObject

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *name;

//将products上新品数组集成进来
@property (nonatomic, strong) NSArray *products;


@end
