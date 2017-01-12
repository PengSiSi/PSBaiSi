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

#import "BaseNavigationController.h"

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
    [self setUpAllChildView];
    [self setUpTabBarBtn];
    [self removeTabBar];
}

- (void)removeTabBar {
    
    // 更换系统TabBar
    CustomTabBar *tabBar = [[CustomTabBar alloc]init];
    tabBar.backgroundColor = [UIColor whiteColor];
    [self setValue:tabBar forKey:@"tabBar"];
}

#pragma mark - 添加所有按钮内容

-(void)setUpTabBarBtn {
    
    BaseNavigationController *nav = self.childViewControllers[0];
    nav.tabBarItem.title = @"精选";
    nav.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_essence_click_icon"];
    
    BaseNavigationController *nav1 = self.childViewControllers[1];
    nav1.tabBarItem.title = @"新帖";
    nav1.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    nav1.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_new_click_icon"];
    
    
    BaseNavigationController *nav2 = self.childViewControllers[2];
    nav2.tabBarItem.title = @"关注";
    nav2.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    nav2.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_friendTrends_click_icon"];
    
    
    BaseNavigationController *nav3 = self.childViewControllers[3];
    nav3.tabBarItem.title = @"我";
    nav3.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    nav3.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_me_click_icon"];
}

-(void)setUpAllChildView{
    
    //精华
    EssenceViewController *essence = [[EssenceViewController alloc] init];
    BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:essence];
    [self addChildViewController:nav];
    
    //新帖
    NewViewController *new = [[NewViewController alloc] init];
    BaseNavigationController *nav1 = [[BaseNavigationController alloc]initWithRootViewController:new];
    [self addChildViewController:nav1];
    
    //关注
    FriendTrendViewController *firend = [[FriendTrendViewController alloc] init];
    BaseNavigationController *nav2 = [[BaseNavigationController alloc]initWithRootViewController:firend];
    [self addChildViewController:nav2];
    
    //我
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MeStoryboard" bundle:nil];
    MeViewController *me = [storyBoard instantiateViewControllerWithIdentifier:@"Me"];
    BaseNavigationController *nav3 = [[BaseNavigationController alloc]initWithRootViewController:me];
    [self addChildViewController:nav3];
}

@end
