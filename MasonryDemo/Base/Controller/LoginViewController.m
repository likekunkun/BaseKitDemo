//
//  LoginViewController.m
//  MasonryDemo
//
//  Created by macbook on 16/7/8.
//  Copyright © 2016年 ymq. All rights reserved.
//

#import "LoginViewController.h"
#import "BaseNavigationViewController.h"
#import "BaseTabBarViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, ScreenWidth, 30);
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitle:@"点击此处登录" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
}

- (void)login
{
    //1. checkdata
    //2. 设置本地信息
    [UserDefault setObject:@"isLogin" forKey:@"1"];
    //3. 到主页面
    [self presentViewController: [[BaseNavigationViewController alloc] initWithRootViewController:[BaseTabBarViewController new]] animated:NO completion:nil];
    
    
}


@end
