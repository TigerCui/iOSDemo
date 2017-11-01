//
//  ShadowRadiusVC.m
//  ShadowDemo
//
//  Created by 崔正清 on 2017/11/1.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "ShadowRadiusVC.h"

@interface ShadowRadiusVC ()

@end

@implementation ShadowRadiusVC

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setupSubViews];
}

#pragma mark - 设置子视图
- (void)p_setupSubViews {
    self.view.backgroundColor = [UIColor whiteColor];
    [self p_setupViewWithY:100 shadowRadius:0];
    [self p_setupViewWithY:170 shadowRadius:3.0];
    [self p_setupViewWithY:240 shadowRadius:10.0];

}

- (void)p_setupViewWithY:(CGFloat)y shadowRadius:(CGFloat)shadowRadius {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(30, y, [UIScreen mainScreen].bounds.size.width - 60, 50)];
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
    view.layer.shadowOpacity = 1;
    view.layer.shadowOffset = CGSizeMake(0, 0);
    view.layer.shadowRadius = shadowRadius;
}

#pragma mark - 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
