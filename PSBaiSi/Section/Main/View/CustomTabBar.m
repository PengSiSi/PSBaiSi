//
//  CustomTabBar.m
//  PSBaiSi
//
//  Created by 思 彭 on 17/1/11.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "CustomTabBar.h"
#import "PublishView.h"

@interface CustomTabBar ()

@property (nonatomic, strong) UIButton *publishButton;
@property (nonatomic, strong) UIControl *previousClickedTabBarButton; // 上一次点击的按钮

@end

@implementation CustomTabBar

// 布局视图

- (void)layoutSubviews {
    
    [super layoutSubviews];
    CGFloat btnH = self.height;
    CGFloat btnW = self.width / (self.items.count + 1);
    CGFloat X = 0;
    CGFloat i = 0;
    
    // 遍历
    for (UIControl *tabBar in self.subviews) {
        if ([tabBar isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {  // 发布按钮
                i += 1;
            }
            X = i * btnW;
            tabBar.frame = CGRectMake(X, 0, btnW, btnH);
            i++;
            
            // 监听点击
            [tabBar addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    self.publishButton.center = CGPointMake(self.width * 0.5, self.height * 0.5);
}

#pragma mark - 懒加载

- (UIButton *)publishButton {
    
    if (!_publishButton) {
        _publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [_publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [self addSubview:_publishButton];
        [_publishButton addTarget:self action:@selector(publishButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_publishButton sizeToFit];
    }
    return _publishButton;
}

#pragma mark - Private Method

- (void)publishButtonClick {
    
    PublishView *publishView = [PublishView createPublishView];
    [[UIApplication sharedApplication].keyWindow addSubview:publishView];
    publishView.frame = [UIApplication sharedApplication].keyWindow.bounds;
}

- (void)tabBarButtonClick: (UIControl *)tabBar {
    
    // 通知重复点击
    if (self.previousClickedTabBarButton == tabBar) {
        // 发通知
        [[NSNotificationCenter defaultCenter]postNotificationName:NOTI_TABBAR_CLICK object:nil];
    }
    self.previousClickedTabBarButton = tabBar;
}

@end
