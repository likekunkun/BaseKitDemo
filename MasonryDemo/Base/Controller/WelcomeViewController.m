//
//  WelcomeViewController.m
//  MasonryDemo
//
//  Created by macbook on 16/6/29.
//  Copyright © 2016年 ymq. All rights reserved.
//

#import "WelcomeViewController.h"
#import "GuidePagesViewController.h"
#import "BaseTabBarViewController.h"
#import "BaseNavigationViewController.h"
#import "LoginViewController.h"

#define kShowTime 5

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake( 0, 0, ScreenWidth, ScreenHeight)];
    // 这里的目的是写网络解析的图片 以便用户下载以后随着节日变化之类的修改启动页的图片
    // 不过为了方便。。就暂时写个本地的图片。
    imageView.image = ImageNamed(@"color");
    
    [self.view addSubview:imageView];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    //    判断当前版本号
    
//    if ([self isNewVersion]) {
    
    if (/* DISABLES CODE */ (1)) {
        [self performSelector:@selector(goToGuidePages) withObject:nil afterDelay:kShowTime];
    } else {
        [self performSelector:@selector(loginAndToMain) withObject:nil afterDelay:kShowTime];
    }
    
}

- (BOOL)isNewVersion
{
    // 获取当前版本号
    NSString *versionString = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    CGFloat currentVersion = versionString.floatValue;
    
    // 获取之前的版本号
    NSString *sandboxVersionKey = @"sandboxVersionKey";
    CGFloat sandboxVersion = [[NSUserDefaults standardUserDefaults] floatForKey:sandboxVersionKey];
    
    // 保存当前的版本号
    [[NSUserDefaults standardUserDefaults] setFloat:currentVersion forKey:sandboxVersionKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    return currentVersion > sandboxVersion;
}

- (void)goToGuidePages
{
    [self.navigationController pushViewController:[GuidePagesViewController new] animated:NO];
}

- (void)loginAndToMain
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
