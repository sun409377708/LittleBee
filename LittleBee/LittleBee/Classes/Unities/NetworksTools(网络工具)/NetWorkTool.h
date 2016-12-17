//
//  NetWorkTool.h
//  QuickCure1
//
//  Created by maoge on 16/10/30.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

/** 成功回调 */
typedef void(^SuccessCompletedBlock)(id responseObject);

/** 失败回调 */
typedef void(^FailureCompletedBlock)(NSError *error);

@interface NetWorkTool:AFHTTPSessionManager

/** 单例 实例化 */
+ (instancetype)shareManager;

/** 自定义的 GET 请求 */
- (void)GET_RequestWithUrlString:(NSString *)urlString
                          parmas:(NSDictionary *)params
                   successBloock:(SuccessCompletedBlock)success
                    failureBlock:(FailureCompletedBlock)failure;


/** 自定义的 POST 请求 */
- (void)POST_RequestWithUrlString:(NSString *)urlString
                           parmas:(NSDictionary *)params
                    successBloock:(SuccessCompletedBlock)success
                     failureBlock:(FailureCompletedBlock)failure;
- (BOOL)isReachableByAFN;

@end

