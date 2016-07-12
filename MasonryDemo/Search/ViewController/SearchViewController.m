//
//  SearchViewController.m
//  MasonryDemo
//
//  Created by macbook on 16/6/29.
//  Copyright © 2016年 ymq. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (instancetype)init
{
    if (self = [super initWithTitle:@"搜索呼呼" leftBarButtonItems:nil rightBarButtonItems:nil]) {
        self.tabBarItem.title = @"搜索";
        self.tabBarItem.image = ImageNamed(@"search");
        // 设置选中图片
        self.tabBarItem.selectedImage = ImageNamed(@"");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

@end
