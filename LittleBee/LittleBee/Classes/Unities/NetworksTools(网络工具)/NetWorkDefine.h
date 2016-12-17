//
//  NetWorkDefine.h
//  QuickCure1
//
//  Created by maoge on 16/10/30.
//  Copyright © 2016年 maoge. All rights reserved.
//

#ifndef NetWorkDefine_h
#define NetWorkDefine_h

/** 基Url */
#define kBaseUrl @"http://iosapi.itcast.cn/loveBeen"

/** 获取首页数据 */
#define kHomePageUrl @"http://iosapi.itcast.cn/loveBeen/focus.json.php"

/** 首页新鲜热卖数据 */
#define kFreshHotSaleUrl @"http://iosapi.itcast.cn/loveBeen/firstSell.json.php"

/** 启动广告数据 */
#define kAdvertisementUrl @"http://iosapi.itcast.cn/loveBeen/ad.json.php"

/** 闪电超市数据接口 */
#define kSuperMarketUrl @"http://iosapi.itcast.cn/loveBeen/supermarket.json.php"

/** 搜索最新关键词接口 */
#define kSearchNewKeyworkUrl @"http://iosapi.itcast.cn/loveBeen/search.json.php"

/** 返回搜索结果接口 */
#define kMpromotionResultUrl @"http://iosapi.itcast.cn/loveBeen/promotion.json.php"

/** 获取我的订单信息接口 */
#define kMyOrdersUrl @"http://iosapi.itcast.cn/loveBeen/MyOrders.json.php"

/** 获取我的优惠券信息接口 */
#define kMyCouponsUrl @"http://iosapi.itcast.cn/loveBeen/MyCoupon.json.php"

/** 获取系统消息接口 */
#define kGetSystemMessageUrl @"http://iosapi.itcast.cn/loveBeen/SystemMessage.json.php"

/** 获取我的消息接口 */
#define kUserMessageUrl @"http://iosapi.itcast.cn/loveBeen/UserMessage.json.php"

/** 获取我的收获地址列表 */
#define kMyAddressUrl @"http://iosapi.itcast.cn/loveBeen/MyAdress.json.php"


/** 百度天气 */
#define kBDWeather_KEY @"17IvzuqmKrK1cGwNL6VQebF9"
#define kGetWeather_URL(city) ([NSString stringWithFormat: @"http://api.map.baidu.com/telematics/v3/weather?location=%@&output=json&ak=%@", city, kBDWeather_KEY])

#endif /* NetWorkDefine_h */
