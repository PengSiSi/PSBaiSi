//
//  FastButton.m
//  PSBaiSi
//
//  Created by 思 彭 on 17/1/12.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "FastButton.h"

@implementation FastButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    [self setUp];
}

- (void)setUp {
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    // 设置布局
    self.imageView.y = 0;
    self.imageView.centerX = self.width * 0.5;
    
    // 自己计算文字的宽
    [self.titleLabel sizeToFit];
    
    // 设置label
    self.titleLabel.centerX = self.width * 0.5;
    self.titleLabel.y = self.height - self.titleLabel.height;
}

@end
