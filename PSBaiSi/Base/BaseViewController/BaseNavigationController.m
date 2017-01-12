//
//  BaseNavigationController.m
//  PSBaiSi
//
//  Created by 思 彭 on 17/1/11.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UIBarButtonItem+GFItem.h"

@interface BaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.view.backgroundColor = [UIColor redColor];
}

// 只加载一次
+ (void)load {
    
    //设置bar字体
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18];
    [bar setTitleTextAttributes:dict];
    
    //设置bar背景图片
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
    //设置item的字体和颜色
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *itemDict = [NSMutableDictionary dictionary];
    itemDict[NSForegroundColorAttributeName] = [UIColor blackColor];
    itemDict[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    [item setTitleTextAttributes:itemDict forState:UIControlStateNormal];
    
    NSMutableDictionary *itemDisableDict = [NSMutableDictionary dictionary];
    itemDisableDict[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [item setTitleTextAttributes:itemDisableDict  forState:UIControlStateDisabled];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count > 0) {//非根控制器
        // 隐藏BottomBar
        viewController.hidesBottomBarWhenPushed = YES;
        
        //返回按钮自定义
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithImage:[UIImage imageNamed:@"navigationButtonReturn"] WithHighlightedImage:[UIImage imageNamed:@"navigationButtonReturnClick"] Target:self action:@selector(backViewController) title:@"返回"];
        
    }
    //跳转(自定义以后在这里真正跳转)
    [super pushViewController:viewController animated:animated];

}

- (void)backViewController {
    
    [self popViewControllerAnimated:YES];
}
@end
