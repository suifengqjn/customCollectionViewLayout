//
//  TBLineCell.m
//  collectionFlows
//
//  Created by qianjianeng on 16/2/3.
//  Copyright © 2016年 SF. All rights reserved.
//

#import "TBLineCell.h"
#import "UIImageView+WebCache.h"
@interface TBLineCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@end
@implementation TBLineCell

- (void)awakeFromNib {
    self.imageview.layer.borderWidth = 3;
    self.imageview.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageview.layer.cornerRadius = 3;
    self.imageview.clipsToBounds = YES;
    
}

-(void)setShop:(TBShopModel *)shop
{
    
    [self.imageview sd_setImageWithURL:[NSURL URLWithString:shop.img] placeholderImage:[UIImage imageNamed:@"loading"]];
}

@end
