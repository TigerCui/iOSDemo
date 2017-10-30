//
//  ShadowColorVC.m
//  ShadowDemo
//
//  Created by 崔正清 on 2017/10/30.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "ShadowColorVC.h"

@interface ShadowColorVC ()

@end

@implementation ShadowColorVC

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setupSubViews];
}

#pragma mark - 设置子视图
- (void)p_setupSubViews {
    self.view.backgroundColor = [UIColor whiteColor];
    [self p_setupViewWithY:100 shadowColor:[UIColor redColor]];
    [self p_setupViewWithY:170 shadowColor:[UIColor blueColor]];
    [self p_setupViewWithY:240 shadowColor:[UIColor yellowColor]];
}

- (void)p_setupViewWithY:(CGFloat)y shadowColor:(UIColor *)shadowColor {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(30, y, [UIScreen mainScreen].bounds.size.width - 60, 50)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    view.layer.shadowOpacity = 1;
    view.layer.shadowColor = shadowColor.CGColor;
}

#pragma mark - 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
