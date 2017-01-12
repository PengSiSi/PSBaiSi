//
//  FriendTrendViewController.m
//  PSBaiSi
//
//  Created by 思 彭 on 17/1/11.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "FriendTrendViewController.h"
#import "UIBarButtonItem+GFItem.h"

@interface FriendTrendViewController ()

@end

@implementation FriendTrendViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self setUpNavBar];
}

#pragma mark - 设置导航条

-(void)setUpNavBar
{
    //左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem ItemWithImage:[UIImage imageNamed:@"friendsRecommentIcon"] WithHighlighted:[UIImage imageNamed:@"friendsRecommentIcon-click"] Target:self action:@selector(friendsRecommentIcon)];
    //右边
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem ItemWithImage:[UIImage imageNamed:@"Search"] WithHighlighted:[UIImage imageNamed:@"Search-click"] Target:self action:@selector(Search)];
    //Titie
    self.navigationItem.title = @"关注";
}

@end
