//
//  ShadowPathVC.m
//  ShadowDemo
//
//  Created by 崔正清 on 2017/11/1.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "ShadowPathVC.h"

@interface ShadowPathVC ()

@end

@implementation ShadowPathVC

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setupSubViews];
}

#pragma mark - 设置子视图
- (void)p_setupSubViews {
    self.view.backgroundColor = [UIColor whiteColor];
    [self p_setupViewWithY1:100];
    [self p_setupViewWithY2:170];
    [self p_setupViewWithY3:240];
}

- (void)p_setupViewWithY1:(CGFloat)y {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(30, y, [UIScreen mainScreen].bounds.size.width - 60, 50)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    view.layer.shadowOpacity = 1;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:view.bounds];
    view.layer.shadowPath = path.CGPath;
}

- (void)p_setupViewWithY2:(CGFloat)y {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(30, y, [UIScreen mainScreen].bounds.size.width - 60, 50)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    view.layer.shadowOpacity = 1;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(0, view.frame.size.height + 10)];
    [path addLineToPoint:CGPointMake(view.frame.size.width, view.frame.size.height + 10)];
    [path addLineToPoint:CGPointMake(view.frame.size.width, 0)];
    [path addLineToPoint:CGPointMake(0, 0)];
    view.layer.shadowPath = path.CGPath;
}

- (void)p_setupViewWithY3:(CGFloat)y {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(30, y, [UIScreen mainScreen].bounds.size.width - 60, 50)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    view.layer.shadowOpacity = 1;
    view.layer.shadowOffset = CGSizeMake(0, 0);
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(-5, 0)];
    [path addLineToPoint:CGPointMake(-5, view.frame.size.height)];
    [path addLineToPoint:CGPointMake(view.frame.size.width, view.frame.size.height)];
    [path addLineToPoint:CGPointMake(view.frame.size.width, 0)];
    view.layer.shadowPath = path.CGPath;
}


#pragma mark - 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
