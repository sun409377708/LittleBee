//
//  ProgressManager.h
//  QuickCure1
//
//  Created by maoge on 16/10/30.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SVProgressHUD.h>

@interface ProgressManager : NSObject

//转菊花
+ (void)alertLoading;

//消息
+ (void)dismissLoading;

//弹出成功消息
+ (void)alertSuccessStatus:(NSString *)success;


/*!
 *  弹出提示消息
 */
+ (void)alertInfoStatus:(NSString *)infoStatus;

//弹出错误消息
+ (void)alertErrorStatus:(NSString *)error;


@end
