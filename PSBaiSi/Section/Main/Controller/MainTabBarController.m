//
//  MainTabBarController.m
//  PSBaiSi
//
//  Created by 思 彭 on 17/1/11.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "MainTabBarController.h"
#import "MeViewController.h"
#import "PublishViewController.h"
#import "EssenceViewController.h"
#import "NewViewController.h"
#import "FriendTrendViewController.h"

#import "CustomTabBar.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

//只加载一次
#pragma mark - 设置tabBar字体格式

+(void)load{
    
    UITabBarItem *titleItem = [UITabBarItem appearanceWhenContainedIn:self, nil];
    //正常
    NSMutableDictionary *normalDict = [NSMutableDictionary dictionary];
    normalDict[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    normalDict[NSForegroundColorAttributeName] = [UIColor grayColor];
    [titleItem setTitleTextAttributes:normalDict forState:UIControlStateNormal];
    //选中
    NSMutableDictionary *selectedDict = [NSMutableDictionary dictionary];
    selectedDict[NSForegroundColorAttributeName] = [UIColor blackColor];
    [titleItem setTitleTextAttributes:selectedDict forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 更换系统TabBar
    
}


@end
