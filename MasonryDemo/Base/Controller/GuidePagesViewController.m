//
//  GuidePagesViewController.m
//  MasonryDemo
//
//  Created by macbook on 16/6/30.
//  Copyright © 2016年 ymq. All rights reserved.
//

#import "GuidePagesViewController.h"
#import "BaseNavigationViewController.h"
#import "BaseTabBarViewController.h"
#import "LoginViewController.h"


@interface GuidePagesViewController ()

{
    NSArray *_icons;
}

@end

@implementation GuidePagesViewController

- (instancetype)init
{
    if (self = [super init]) {
        _icons = @[@"", @"", @""];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, ScreenWidth, 30);
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitle:@"这是引导页" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(loginOrToMain) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
    
    
    
}

- (void)initScrollView
{
    UIScrollView *scrollView = [UIScrollView new];
    [self.view addSubview:scrollView];
    
}

- (void)loginOrToMain
{
    NSString *isLogin = [UserDefault objectForKey:@"isLogin"];
    if ([isLogin isEqualToString:@"1"]) {
        // 登录的话就到首页
        [self.navigationController pushViewController:[[BaseNavigationViewController alloc] initWithRootViewController:[BaseTabBarViewController new]] animated:YES];
    } else {
        // 没登录的话 就去登录
        [self presentViewController:[LoginViewController new] animated:NO completion:nil];

    }
    
}

@end
