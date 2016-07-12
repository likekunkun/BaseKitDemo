//
//  BaseViewController.m
//  MasonryDemo
//
//  Created by macbook on 16/7/8.
//  Copyright © 2016年 ymq. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

// only for tabBarItem
- (instancetype)initWithTitle:(NSString *)title
           leftBarButtonItems:(NSArray *)leftBarButtonItems
          rightBarButtonItems:(NSArray *)rightBatButtonItems
{
    if (self = [super init]) {
        NSMutableDictionary *barItem = @{}.mutableCopy;
        [barItem setObject:title ? title : @"" forKey:@"title"];
        if (leftBarButtonItems) {
            [barItem setObject:leftBarButtonItems forKey:@"leftBarButtonItems"];
        }
        if (rightBatButtonItems) {
            [barItem setObject:rightBatButtonItems forKey:@"rightBarButtonItems"];
        }
        self.barItem = barItem;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.barItem) {
        [NotificationCenter postNotificationName:NotificationTabDidChanged object:self.barItem];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ColorWhite;
}



@end
