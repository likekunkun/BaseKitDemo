//
//  UserViewController.m
//  MasonryDemo
//
//  Created by macbook on 16/7/7.
//  Copyright © 2016年 ymq. All rights reserved.
//

#import "UserViewController.h"

@interface UserViewController ()

@end

@implementation UserViewController

- (instancetype)init
{
    if (self = [super initWithTitle:@"mine" leftBarButtonItems:nil rightBarButtonItems:nil]) {
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = ImageNamed(@"user");
        // 设置选中图片
        self.tabBarItem.selectedImage = ImageNamed(@"");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



@end
