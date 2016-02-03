//
//  TBWaterFlowLayout.h
//  collectionFlows
//
//  Created by qianjianeng on 16/2/2.
//  Copyright © 2016年 SF. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TBWaterFlowLayout;

@protocol TBWaterflowLayoutDelegate <NSObject>
- (CGFloat)waterflowLayout:(TBWaterFlowLayout *)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath;
@end

@interface TBWaterFlowLayout : UICollectionViewLayout

@property (nonatomic, assign) UIEdgeInsets sectionInset;
/** 每一列之间的间距 */
@property (nonatomic, assign) CGFloat columnMargin;
/** 每一行之间的间距 */
@property (nonatomic, assign) CGFloat rowMargin;
/** 显示多少列 */
@property (nonatomic, assign) int columnsCount;

@property (nonatomic, weak) id<TBWaterflowLayoutDelegate> delegate;

@end
