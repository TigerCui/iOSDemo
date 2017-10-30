//
//  ShadowOffsetVC.m
//  ShadowDemo
//
//  Created by 崔正清 on 2017/10/30.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "ShadowOffsetVC.h"

@interface ShadowOffsetVC ()

@end

@implementation ShadowOffsetVC

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setupSubViews];
}

#pragma mark - 设置子视图
- (void)p_setupSubViews {
    self.view.backgroundColor = [UIColor whiteColor];
    [self p_setupViewWithY:100 shadowOffset:CGSizeMake(0, 0)];
    [self p_setupViewWithY:170 shadowOffset:CGSizeMake(5, 0)];
    [self p_setupViewWithY:240 shadowOffset:CGSizeMake(-5, 0)];
    [self p_setupViewWithY:310 shadowOffset:CGSizeMake(0, 5)];
    [self p_setupViewWithY:380 shadowOffset:CGSizeMake(0, -5)];
    [self p_setupViewWithY:450 shadowOffset:CGSizeMake(5, 5)];
    [self p_setupViewWithY:520 shadowOffset:CGSizeMake(-5, -5)];
}

- (void)p_setupViewWithY:(CGFloat)y shadowOffset:(CGSize)shadowOffset {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(30, y, [UIScreen mainScreen].bounds.size.width - 60, 50)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    view.layer.shadowOpacity = 1;
    view.layer.shadowOffset = shadowOffset;
}

#pragma mark - 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
