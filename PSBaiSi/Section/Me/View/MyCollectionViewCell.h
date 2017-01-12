//
//  MyCollectionViewCell.h
//  PSBaiSi
//
//  Created by 思 彭 on 17/1/12.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemModel.h"

@interface MyCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) ItemModel *itemModel;

@end
