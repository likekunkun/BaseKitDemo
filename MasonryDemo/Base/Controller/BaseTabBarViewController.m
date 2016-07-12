//
//  MQTabBarViewController.m
//  MasonryDemo
//
//  Created by macbook on 16/6/29.
//  Copyright © 2016年 ymq. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "HomePageViewController.h"
#import "SearchViewController.h"
#import "UserViewController.h"

@interface BaseTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation BaseTabBarViewController

- (void)dealloc
{
    [NotificationCenter removeObserver:self name:NotificationTabDidChanged object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = [UIColor blueColor];
    
    // 设置 left/rightBarButtonItems
    [NotificationCenter addObserver:self selector:@selector(tabBarDidChange:) name:NotificationTabDidChanged object:nil];
    
    // 只有一个 navigationController
    [self initControllers];
    
    // 1.为了设置第二次点击tabBarItem的时候 刷新当前界面 或者做其他的处理
    self.delegate = self;
}

- (void)initControllers
{
    NSArray *tabControllerNames = @[@"HomePageViewController",
                                    @"SearchViewController",
                                    @"UserViewController"];
    NSMutableArray *tabControllers = @[].mutableCopy;
    [tabControllerNames enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *controllerName = obj;
        Class class = NSClassFromString(controllerName);
        if (class) {
            [tabControllers addObject:[class new]];
        }
    }];
        self.viewControllers = tabControllers;
}

- (void)tabBarDidChange:(NSNotification *)notification
{
    NSDictionary *dic = notification.object;
    self.title = [dic objectForKey:@"title"];
    self.navigationItem.rightBarButtonItems = dic[@"rightBarButtonItems"];
    self.navigationItem.leftBarButtonItems = dic[@"leftBarButtonItems"];
}

// 2. 在这里写刷新的方法。
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    // 判断当前选中的界面和下一个选中的界面是不是同一个界面  如果是的话 又是刷新界面的话 就进行刷新
    if (tabBarController.selectedViewController == viewController) {
        //这里的RefreshViewController 是你自己写的可以刷新的那个界面 这里进行判断：能够刷新的界面才刷新
//        if ([viewController isKindOfClass:[RefreshViewController class]]) {
//            RefreshViewController *contrller = (RefreshViewController *)viewController;
//            [contrller startRefresh];
//        }
// 这里如果不明白 po tabBarController.selectedViewController 之后 po viewController就能很清晰逻辑了
    }
    return YES;
}

@end
