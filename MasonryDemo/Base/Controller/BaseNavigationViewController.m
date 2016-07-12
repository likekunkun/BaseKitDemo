//
//  BaseNavigationViewController.m
//  MasonryDemo
//
//  Created by macbook on 16/6/29.
//  Copyright © 2016年 ymq. All rights reserved.
//

#import "BaseNavigationViewController.h"
#import "UIImage+YYAdd.h"

@interface BaseNavigationViewController ()<UINavigationControllerDelegate>

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置navigationBar样式
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName : FontSize(15),
                                               NSForegroundColorAttributeName : ColorWhite};
    
    
    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor greenColor]] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];

    //1. 设置返回手势 （在自定义返回按钮的时候 系统自带的返回手势可能不好用）
    self.delegate = self;
    
}

// 2.协议方法
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
    NSLog(@"%@ did show", [viewController.class description]);
}

@end
