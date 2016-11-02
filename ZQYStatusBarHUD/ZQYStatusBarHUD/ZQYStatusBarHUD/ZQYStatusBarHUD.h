//
//  ZQYStatusBarHUD.h
//  ZQYStatusBarHUD
//
//  Created by apple on 16/10/27.
//  Copyright © 2016年 ZQY.YXWL.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#define _ZQYStatusBarHUD [ZQYStatusBarHUD sharedHud]
/**
 通知的类型

 - ZQYNotificationStyleStatusBarNotification: statusbar 通知
 - ZQYNotificationStyleNavigationBarNotification: 导航栏 通知
 */
typedef NS_ENUM(NSInteger, ZQYNotificationStyle) {
    ZQYNotificationStyleStatusBarNotification,
    ZQYNotificationStyleNavigationBarNotification
};


/**
 点击通知的回调
 */
typedef void(^ZQYStatusBarHudTapBlock)(void);

@interface ZQYStatusBarHUD : NSObject


+ (ZQYStatusBarHUD *)sharedHud;
/**
 点击的回调
 */
@property (nonatomic ,copy)ZQYStatusBarHudTapBlock block;

/**
 通知style 默认 ZQYNotificationStyleStatusBarNotification
 */
@property (nonatomic ,assign)ZQYNotificationStyle notificationStyle;

/**
 背景颜色 默认 黑色
 */
@property (nonatomic ,strong)UIColor *notificationLabelBackGroundColor;

/**
 通知文字颜色 默认白色
 */
@property (nonatomic ,strong)UIColor *notificationLabelTextColor;

/**
 通知字体 默认系统 13号
 */
@property (nonatomic ,strong)UIFont *notificationLabelFont;

/**
 成功

 @param msg msg
 */
- (void)zqy_showSuccess:(NSString *)msg;

/**
 失败

 @param msg msg
 */
- (void)zqy_showError:(NSString *)msg;


/**
 正字加载

 @param msg msg
 */
- (void)zqy_showLoading:(NSString *)msg;


/**
 普通的通知  纯文本

 @param msg msg
 */
- (void)zqy_showMessage:(NSString *)msg;

/**
 带图片的通知

 @param msg msg
 @param image 图片
 */
- (void)zqy_showMessage:(NSString *)msg image:(UIImage *)image;


/**
 通知消失
 */
- (void)zqy_hidden;
@end
