//
//  ViewController.m
//  collectionFlows
//
//  Created by qianjianeng on 16/2/2.
//  Copyright © 2016年 SF. All rights reserved.
//

#import "ViewController.h"
#import "TBWaterFlowViewController.h"
#import "TBStackViewController.h"
#import "TBLineViewController.h"
#import "TBCycleViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)waterFlow:(UIButton *)sender {
    TBWaterFlowViewController *waterVC = [TBWaterFlowViewController new];
    [self.navigationController pushViewController:waterVC animated:YES];
}

- (IBAction)stackFlow:(UIButton *)sender {
    TBStackViewController *stackVC = [TBStackViewController new];
    [self.navigationController pushViewController:stackVC animated:YES];
    
}
- (IBAction)shuiping:(UIButton *)sender {
    TBLineViewController *stackVC = [TBLineViewController new];
    [self.navigationController pushViewController:stackVC animated:YES];
}
- (IBAction)huanrao:(UIButton *)sender {
    TBCycleViewController *stackVC = [TBCycleViewController new];
    [self.navigationController pushViewController:stackVC animated:YES];
}


@end
