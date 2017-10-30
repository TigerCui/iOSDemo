//
//  SimpleShadowVC.m
//  ShadowDemo
//
//  Created by 崔正清 on 2017/10/22.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "SimpleShadowVC.h"

@interface SimpleShadowVC ()

@end

@implementation SimpleShadowVC

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setupSubViews];
}

#pragma mark - 设置子视图
- (void)p_setupSubViews {
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(30, 100, [UIScreen mainScreen].bounds.size.width - 60, 50)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    view.layer.shadowOpacity = 1;
}

#pragma mark - 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
