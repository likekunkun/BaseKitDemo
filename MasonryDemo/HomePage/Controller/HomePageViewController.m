//
//  HomePageViewController.m
//  MasonryDemo
//
//  Created by macbook on 16/6/29.
//  Copyright © 2016年 ymq. All rights reserved.
//

#import "HomePageViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (instancetype)init
{
    if (self = [super initWithTitle:@"Demo" leftBarButtonItems:nil rightBarButtonItems:nil]) {
        self.tabBarItem.title = @"首页";
        self.tabBarItem.image = ImageNamed(@"homePage");
        // 设置选中图片
        self.tabBarItem.selectedImage = ImageNamed(@"");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}



@end
