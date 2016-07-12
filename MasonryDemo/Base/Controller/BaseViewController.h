//
//  BaseViewController.h
//  MasonryDemo
//
//  Created by macbook on 16/7/8.
//  Copyright © 2016年 ymq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, strong) NSMutableDictionary *barItem;

- (instancetype)initWithTitle:(NSString *)title
           leftBarButtonItems:(NSArray *)leftBarButtonItems
          rightBarButtonItems:(NSArray *)rightBatButtonItems;


@end
