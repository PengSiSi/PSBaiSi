//
//  MyCollectionViewCell.m
//  PSBaiSi
//
//  Created by 思 彭 on 17/1/12.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "MyCollectionViewCell.h"
#import <UIImageView+WebCache.h>

@implementation MyCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imgView.userInteractionEnabled = YES;
    self.titleLabel.userInteractionEnabled = YES;
}

- (void)setItemModel:(ItemModel *)itemModel {
    
    _itemModel = itemModel;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:self.itemModel.icon] placeholderImage:nil];
    self.titleLabel.text = self.itemModel.name;
}
@end
