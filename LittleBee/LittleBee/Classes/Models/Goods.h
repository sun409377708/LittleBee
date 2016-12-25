//
//  Goods.h
//  LittleBee
//
//  Created by maoge on 16/12/24.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Goods : NSObject
/** 商品id*/
@property (nonatomic, copy) NSString *gid;
/** 商品名*/
@property (nonatomic, copy) NSString *name;
/** 价格*/
@property (nonatomic, copy) NSString *price;
/** 超市价格*/
@property (nonatomic, copy) NSString *market_price;
/** 库存数量*/
@property (nonatomic, copy) NSString *number;
/** 本地图片*/
@property (nonatomic, copy) NSString *pre_img;
/** 质量*/
@property (nonatomic, copy) NSString *specifics;
/** 商品图片*/
@property (nonatomic, copy) NSString *img;


@end
