//
//  TBStackViewController.m
//  collectionFlows
//
//  Created by qianjianeng on 16/2/2.
//  Copyright © 2016年 SF. All rights reserved.
//

#import "TBStackViewController.h"
#import "TBStackLayout.h"
#import "TBShopCell.h"
#import "MJRefresh.h"
#import "TBShopModel.h"
#import "MJExtension.h"
@interface TBStackViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *shops;

@end

static NSString *const ID = @"shop";

@implementation TBStackViewController

- (NSMutableArray *)shops
{
    if (_shops == nil) {
        self.shops = [NSMutableArray array];
    }
    return _shops;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    NSArray *shopArray = [TBShopModel objectArrayWithFilename:@"1.plist"];
    [self.shops addObjectsFromArray:shopArray];
    
    
    TBStackLayout *layout = [[TBStackLayout alloc] init];
    //layout.delegate = self;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerNib:[UINib nibWithNibName:@"TBShopCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    // 3.增加刷新控件
    [self.collectionView addFooterWithTarget:self action:@selector(loadMoreShops)];
    
}
- (void)loadMoreShops
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray *shopArray = [TBShopModel objectArrayWithFilename:@"1.plist"];
        [self.shops addObjectsFromArray:shopArray];
        [self.collectionView reloadData];
        [self.collectionView footerEndRefreshing];
    });
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.shops.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TBShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.shop = self.shops[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TBShopModel *shop = self.shops[indexPath.item];
    [self.shops removeObject:shop];
    [collectionView reloadData];
}

@end
