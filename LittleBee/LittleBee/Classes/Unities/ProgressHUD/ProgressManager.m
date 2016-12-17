//
//  ProgressManager.m
//  QuickCure1
//
//  Created by maoge on 16/10/30.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "ProgressManager.h"

@implementation ProgressManager


/*!
 *  转菊花
 */
+ (void)alertLoading{
    
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
}

/*!
 *  消息
 */
+ (void)dismissLoading{
    
    [SVProgressHUD dismiss];
}

/*!
 *  弹出成功消息
 */
+ (void)alertSuccessStatus:(NSString *)success{
    
    [SVProgressHUD showSuccessWithStatus:success];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
}

/*!
 *  弹出提示消息
 */
+ (void)alertInfoStatus:(NSString *)infoStatus{
    
    [SVProgressHUD showInfoWithStatus:infoStatus];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
}

/*!
 *  弹出错误消息
 */
+ (void)alertErrorStatus:(NSString *)error{
    
    [SVProgressHUD showErrorWithStatus:error];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
}

@end
