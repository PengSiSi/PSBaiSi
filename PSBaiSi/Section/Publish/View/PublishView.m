//
//  PublishView.m
//  PSBaiSi
//
//  Created by 思 彭 on 17/1/11.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "PublishView.h"
#import "FastButton.h"

// 根控制器视图
#define rootView [UIApplication sharedApplication].keyWindow.rootViewController.view
#define margin (10)

@implementation PublishView

- (void)awakeFromNib {
    
    [super awakeFromNib];
    // 根视图不能点击
    rootView.userInteractionEnabled = YES;
    self.userInteractionEnabled = YES;
    [self createSubViewsButton];
}

- (void)createSubViewsButton {
    
    NSArray *titles = @[@"发视频",@"发图片",@"发段子",@"发声音",@"审帖子",@"离线下载"];
    NSArray *images = @[@"publish-video",@"publish-picture",@"publish-text",@"publish-audio",@"publish-review",@"publish-offline"];
    CGFloat buttonW = 72;
    CGFloat buttonH = buttonW + 30;
    NSInteger maxCols = 3;
    CGFloat buttonStratX = 2 * margin;
    CGFloat buttonXMargin = (K_SCREEN_WIDTH - 2 * buttonStratX - maxCols * buttonW) / (maxCols - 1);
    CGFloat buttonYMargin = margin;
    
    CGFloat buttonStratY = (K_SCREEN_HEIGHT - 2 * buttonH) * 0.5;
    for (NSInteger  i = 0; i < titles.count; i++) {
        
        // 创建按钮
        FastButton *button = [FastButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        button.tag = i;
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        // 计算frame
        NSInteger row = titles.count / maxCols;
        NSInteger col = titles.count % maxCols;
        CGFloat buttonX = buttonStratX + col * (buttonW + buttonXMargin);
        CGFloat buttonEndY = buttonStratY + row * (buttonH + buttonYMargin);
        CGFloat buttonBeginY = buttonEndY - K_SCREEN_HEIGHT;
        [self addSubview:button];

        // 添加动画
        
        // 创建标语
        UIImageView *titleImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"app_slogan"]];
        titleImageView.y = K_SCREEN_HEIGHT * 0.15 - K_SCREEN_HEIGHT;
        [self addSubview:titleImageView];

        // 标语动画
        
    }
}

+ (instancetype)createPublishView {
    
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self cancleWithCompletionBlock:nil];
}

- (void)cancleWithCompletionBlock: (void (^)())completionBlock {
    
    rootView.userInteractionEnabled = NO;
    self.userInteractionEnabled = NO;
    NSInteger beginI = 2;
    for (NSInteger i = beginI; i < self.subviews.count; i++) {
        
    }
}

- (IBAction)cancleDidClick:(id)sender {
    
    [self removeFromSuperview];
}

#pragma mark - Private Method

- (void)buttonClick: (FastButton *)button {
    
}

@end
