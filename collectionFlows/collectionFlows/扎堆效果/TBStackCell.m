//
//  TBStackCell.m
//  collectionFlows
//
//  Created by qianjianeng on 16/2/2.
//  Copyright © 2016年 SF. All rights reserved.
//

#import "TBStackCell.h"
#import "TBShopModel.h"
#import "UIImageView+WebCache.h"
@interface TBStackCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation TBStackCell

- (void)setShop:(TBShopModel *)shop
{
    _shop = shop;
    
    // 1.图片
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:shop.img] placeholderImage:[UIImage imageNamed:@"loading"]];

}
@end
