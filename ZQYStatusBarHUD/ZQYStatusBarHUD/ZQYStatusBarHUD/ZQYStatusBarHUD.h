//
//  ZQYStatusBarHUD.h
//  ZQYStatusBarHUD
//
//  Created by apple on 16/10/27.
//  Copyright © 2016年 ZQY.YXWL.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQYStatusBarHUD : NSObject
+ (void)zqy_showSuccess:(NSString *)msg;
+ (void)zqy_showError:(NSString *)msg;
+ (void)zqy_showLoading:(NSString *)msg;

+ (void)zqy_showMessage:(NSString *)msg;
+ (void)zqy_showMessage:(NSString *)msg image:(UIImage *)image;

+ (void)zqy_hidden;
@end
