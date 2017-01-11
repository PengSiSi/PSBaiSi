//
//  AdvertiseViewController.m
//  PSBaiSi
//
//  Created by 思 彭 on 17/1/11.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "AdvertiseViewController.h"
#import "MainTabBarController.h"

@interface AdvertiseViewController ()

@property (weak, nonatomic) IBOutlet UIButton *jumpButton;
- (IBAction)jumpButtonDidClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *bgImgView;
@property (strong ,nonatomic) NSTimer *timer;

@end

@implementation AdvertiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 创建定时器
    [self setUpNSTimer];
}

- (IBAction)jumpButtonDidClick:(id)sender {

    MainTabBarController *mainTabBarVc = [[MainTabBarController alloc]init];
    [UIApplication sharedApplication].keyWindow.rootViewController = mainTabBarVc;
    // 停止定时器
    [self.timer invalidate];
}

#pragma mark - 创建定时器

- (void)setUpNSTimer {
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
}

- (void)timeChange {
    
    static NSInteger i = 3;
    if (i == 0) {
        
        MainTabBarController *mainTabBarVc = [[MainTabBarController alloc]init];
        [UIApplication sharedApplication].keyWindow.rootViewController = mainTabBarVc;
        // 停止定时器
        [self.timer invalidate];
    }
    i--;
    // 设置按钮的文字
    [self.jumpButton setTitle:[NSString stringWithFormat:@"跳转(%ld)",i] forState:UIControlStateNormal];
}


@end
