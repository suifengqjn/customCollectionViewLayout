//
//  TBCycleCell.m
//  collectionFlows
//
//  Created by qianjianeng on 16/2/3.
//  Copyright © 2016年 SF. All rights reserved.
//

#import "TBCycleCell.h"
#import "UIImageView+WebCache.h"
@interface TBCycleCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageIVew;

@end
@implementation TBCycleCell

-(void)setShop:(TBShopModel *)shop
{
    
   [self.imageIVew sd_setImageWithURL:[NSURL URLWithString:shop.img] placeholderImage:[UIImage imageNamed:@"loading"]];
}


- (void)awakeFromNib {
    self.imageIVew.layer.borderWidth = 3;
    self.imageIVew.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageIVew.layer.cornerRadius = 3;
    self.imageIVew.clipsToBounds = YES;
}
@end
