//
//  MeViewController.m
//  PSBaiSi
//
//  Created by 思 彭 on 17/1/11.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "MeViewController.h"
#import "MyCollectionViewCell.h"
#import "UIBarButtonItem+GFItem.h"
#import "ItemModel.h"
#import "MyWebViewController.h"

static NSString *const identify = @"MyCollectionViewCell";
static NSInteger const cols = 4;
static CGFloat const margin = 1;

#define itemW  (K_SCREEN_WIDTH - (cols - 1) * margin) / cols

@interface MeViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation MeViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    [self loadData];
    [self setUI];
    [self setNavItem];
}

- (void)loadData {
   
    [SVProgressHUD show];
    NSDictionary *param = @{@"a" : @"square",
                            @"c" : @"topic"};
    [HTTPTool getWithURL:MY_URL headers:nil params:param success:^(id json) {
        
        NSLog(@"json = %@",json);
        self.dataArray = [ItemModel mj_objectArrayWithKeyValuesArray:json[@"square_list"]];
        // 设置collectionView的高度
        NSInteger rows = self.dataArray.count / cols;
        self.collectionView.height = rows * itemW + (rows * margin);
        
        // 注意: 这里一定要设置一次,否则高度不对!!
        self.tableView.tableFooterView = self.collectionView;
        [self.collectionView reloadData];
        [SVProgressHUD dismiss];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:KREQUESTERROR];
    }];
}

- (void)setUI {
    
    self.tableView.tableFooterView = self.collectionView;
}

- (void)setNavItem {
    
    //右边
    UIBarButtonItem *item1 = [UIBarButtonItem ItemWithImage:[UIImage imageNamed:@"mine-setting-icon"] WithHighlighted:[UIImage imageNamed:@"mine-setting-icon-click"] Target:self action:@selector(setting)];
    UIBarButtonItem *item2 = [UIBarButtonItem ItemWithImage:[UIImage imageNamed:@"mine-moon-icon"] WithSelected:[UIImage imageNamed:@"mine-moon-icon-click"] Target:self action:@selector(moon:)];
    self.navigationItem.rightBarButtonItems = @[item1,item2];
}

#pragma mark - UITableView DataSource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.0001f;
}

#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.itemModel = self.dataArray[indexPath.item];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(itemW, itemW);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ItemModel *model = self.dataArray[indexPath.item];
    if (![model.url containsString:@"http"]) {
        return;
    }
    MyWebViewController *webVc = [[MyWebViewController alloc]init];
    webVc.url = [NSURL URLWithString:model.url];
    webVc.title = model.name;
    [self.navigationController pushViewController:webVc animated:YES];
}

#pragma mark - 懒加载

- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        //设置尺寸
        layout.minimumLineSpacing = margin;
        layout.minimumInteritemSpacing = margin;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 300) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        //关闭滚动
        _collectionView.scrollEnabled = NO;
        
        //设置数据源和代理
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        //注册
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MyCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:identify];
    }
    return _collectionView;
}

#pragma mark - Private Method

-(void)setting {
//    //XIB加载
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:NSStringFromClass([GFSettingViewController class]) bundle:nil];
//    
//    GFSettingViewController *settingVc = [storyBoard instantiateInitialViewController];
//    [self.navigationController pushViewController:settingVc animated:YES];
}

-(void)moon:(UIButton *)btn {
    
    btn.selected = !btn.selected;
}

@end
