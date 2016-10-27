//
//  ZQYStatusBarHUD.m
//  ZQYStatusBarHUD
//
//  Created by apple on 16/10/27.
//  Copyright © 2016年 ZQY.YXWL.com. All rights reserved.
// 0.0.0

#import "ZQYStatusBarHUD.h"

#define ZQY_MASSAGE_FONT [UIFont systemFontOfSize:13]

static CGFloat const ZQYMessageDuration = 2.0;
static CGFloat const ZQYAnimationDuration = 0.25;

@implementation ZQYStatusBarHUD

static UIWindow *window_;
static NSTimer *timer_;

+ (void)setupWindow{
    
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    
    frame.origin.y = 0;
    [UIView animateWithDuration:ZQYAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

+ (void)zqy_showSuccess:(NSString *)msg{
    [self zqy_showMessage:msg image:[UIImage imageNamed:@"ZQYStatusBarHUD.bundle/success"]];
}

+ (void)zqy_showError:(NSString *)msg{
    [self zqy_showMessage:msg image:[UIImage imageNamed:@"ZQYStatusBarHUD.bundle/fail"]];
}

+ (void)zqy_showLoading:(NSString *)msg{
    
    [timer_ invalidate];
    timer_ = nil;
    
    [self setupWindow];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = ZQY_MASSAGE_FONT;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName :ZQY_MASSAGE_FONT}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) / 2 - 20;
    CGFloat centerY = window_.frame.size.height / 2;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
}

+ (void)zqy_showMessage:(NSString *)msg{
    [self zqy_showMessage:msg image:nil];
}

+ (void)zqy_showMessage:(NSString *)msg image:(UIImage *)image{
    
    [timer_ invalidate];
    
    [self setupWindow];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = ZQY_MASSAGE_FONT;
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:ZQYMessageDuration target:self selector:@selector(zqy_hidden) userInfo:nil repeats:NO];
}

+ (void)zqy_hidden{
    [UIView animateWithDuration:ZQYAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}
@end
