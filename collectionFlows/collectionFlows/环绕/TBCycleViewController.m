//
//  TBCycleViewController.m
//  collectionFlows
//
//  Created by qianjianeng on 16/2/3.
//  Copyright © 2016年 SF. All rights reserved.
//

#import "TBCycleViewController.h"
#import "TBCycleCell.h"
#import "TBCycleLayout.h"
#import "MJExtension.h"
#import "TBLineLayout.h"
#import "TBStackLayout.h"
@interface TBCycleViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *shops;

@end

static NSString *const ID = @"image";

@implementation TBCycleViewController

- (NSMutableArray *)shops
{
    if (_shops == nil) {
        self.shops = [NSMutableArray array];
    }
    return _shops;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *shopArray = [TBShopModel objectArrayWithFilename:@"1.plist"];
    [self.shops addObjectsFromArray:shopArray];
    
    CGFloat w = self.view.frame.size.width;
    CGRect rect = CGRectMake(0, 100, w, 220);

    self.collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:[[TBCycleLayout alloc] init]];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"TBCycleCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:_collectionView];

    [self addButton];
}


- (void)addButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, self.view.frame.size.height-200, 100, 30);
    [button setTitle:@"切换效果" forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor blueColor];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(ButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)ButtonClick
{
    if ([self.collectionView.collectionViewLayout isKindOfClass:[TBCycleLayout class]]) {
        [self.collectionView setCollectionViewLayout:[[TBLineLayout alloc] init] animated:YES];
    } else if ([self.collectionView.collectionViewLayout isKindOfClass:[TBLineLayout class]]) {
        [self.collectionView setCollectionViewLayout:[[TBStackLayout alloc] init] animated:YES];
    } else if([self.collectionView.collectionViewLayout isKindOfClass:[TBStackLayout class]]) {
        [self.collectionView setCollectionViewLayout:[[TBCycleLayout alloc] init] animated:YES];
    }
    [self.collectionView reloadData];
}
#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.shops.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TBCycleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
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
