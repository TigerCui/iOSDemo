//
//  ShadowOpacityVC.m
//  ShadowDemo
//
//  Created by 崔正清 on 2017/10/30.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "ShadowOpacityVC.h"

@interface ShadowOpacityVC ()

@end

@implementation ShadowOpacityVC

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setupSubViews];
}

#pragma mark - 设置子视图
- (void)p_setupSubViews {
    self.view.backgroundColor = [UIColor whiteColor];
    [self p_setupViewWithY:100 shadowOpacity:0.2];
    [self p_setupViewWithY:170 shadowOpacity:0.6];
    [self p_setupViewWithY:240 shadowOpacity:0.9];
}

- (void)p_setupViewWithY:(CGFloat)y shadowOpacity:(float)shadowOpacity {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(30, y, [UIScreen mainScreen].bounds.size.width - 60, 50)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    view.layer.shadowOpacity = shadowOpacity;
}

#pragma mark - 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
