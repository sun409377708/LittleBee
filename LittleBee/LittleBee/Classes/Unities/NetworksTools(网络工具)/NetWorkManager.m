//
//  NetWorkManager.m
//  QuickCure1
//
//  Created by maoge on 16/10/30.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "NetWorkManager.h"
#import "NetWorkTool.h"
//#import "Users.h"
//#import "Disease.h"


@implementation NetWorkManager

/** 单例 */
+(instancetype)sharedManager{
    
    static NetWorkManager *instance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        instance = [[NetWorkManager alloc] init];
        
    });
    return instance;
}




@end
