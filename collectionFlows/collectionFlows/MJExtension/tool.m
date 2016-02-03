//
//  tool.m
//  collectionFlows
//
//  Created by qianjianeng on 16/2/2.
//  Copyright © 2016年 SF. All rights reserved.
//

#import "tool.h"

@implementation tool


/**
 *  通过plist来创建一个模型数组
 *  @param filename 文件名(仅限于mainBundle中的文件)
 *  @return 模型数组
 */
+ (NSString *)objectArrayWithFilename:(NSString *)filename
{
    
    return  [[NSBundle mainBundle] pathForResource:filename ofType:nil];
    
}


@end
