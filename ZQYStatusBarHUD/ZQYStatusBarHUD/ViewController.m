//
//  ViewController.m
//  ZQYStatusBarHUD
//
//  Created by apple on 16/10/27.
//  Copyright © 2016年 ZQY.YXWL.com. All rights reserved.
//

#import "ViewController.h"
#import "ZQYStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    // Do any additional setup after loading the view, t  ypically from a nib.
}


- (IBAction)sccess:(id)sender {
    _ZQYStatusBarHUD.notificationLabelFont = [UIFont systemFontOfSize:19];
    _ZQYStatusBarHUD.notificationStyle = ZQYNotificationStyleNavigationBarNotification;
    [_ZQYStatusBarHUD zqy_showSuccess:@"加载成功"];
}
- (IBAction)fail:(id)sender {
    _ZQYStatusBarHUD.notificationStyle = ZQYNotificationStyleStatusBarNotification;
    [_ZQYStatusBarHUD zqy_showError:@"加载失败"];
}
- (IBAction)loading:(id)sender {
    _ZQYStatusBarHUD.block = ^{
        NSLog(@"aaa");
        [self.navigationController pushViewController:[UIViewController new] animated:YES];
    };
    [_ZQYStatusBarHUD zqy_showLoading:@"正在加载..."];
}

- (IBAction)message:(id)sender {
    [_ZQYStatusBarHUD zqy_showMessage:@"文字文字"];
}

- (IBAction)hidden:(id)sender {
    [_ZQYStatusBarHUD zqy_hidden];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
