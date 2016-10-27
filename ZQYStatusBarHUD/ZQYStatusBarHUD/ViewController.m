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
    [ZQYStatusBarHUD zqy_showSuccess:@"加载成功"];
}
- (IBAction)fail:(id)sender {
    [ZQYStatusBarHUD zqy_showError:@"加载失败"];
}
- (IBAction)loading:(id)sender {
    [ZQYStatusBarHUD zqy_showLoading:@"正在加载..."];
}

- (IBAction)message:(id)sender {
    [ZQYStatusBarHUD zqy_showMessage:@"文字文字"];
}

- (IBAction)hidden:(id)sender {
    [ZQYStatusBarHUD zqy_hidden];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
