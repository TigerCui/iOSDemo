//
//  ViewController.m
//  ShadowDemo
//
//  Created by 崔正清 on 2017/10/20.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

static float kScreenWidth;
static float kScreenHeight;
static float kItemWidth;
static float kItemHeight;

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    kScreenWidth = [UIScreen mainScreen].bounds.size.width;
    kScreenHeight = [UIScreen mainScreen].bounds.size.height;
    kItemWidth = kScreenWidth - 40.0;
    kItemHeight = 88.0;
    [self p_setupSubViews];
}

#pragma mark - 设置子视图
- (void)p_setupSubViews {
    for (int i = 0; i < 6; i++) {
        int row = i / 1;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20 , 30 + (kItemHeight + 30) * row , kItemWidth, kItemHeight)];
        [self.view addSubview:view];
        view.backgroundColor = [UIColor lightGrayColor];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, view.bounds.size.width, view.bounds.size.height)];
        [view addSubview:label];
        label.font = [UIFont systemFontOfSize:14];
        label.numberOfLines = 0;
        
        if (i == 0) {
            label.text = @"view.layer.shadowColor = [UIColor redColor].CGColor;";
            view.layer.shadowColor = [UIColor redColor].CGColor;
        }
        if (i == 1) {
            label.text = @"view.layer.shadowColor = [UIColor redColor].CGColor;\nview.layer.shadowOpacity = 1;";
            view.layer.shadowColor = [UIColor redColor].CGColor;
            view.layer.shadowOpacity = 1;
        }
        if (i == 2) {
            label.text = @"view.layer.shadowColor = [UIColor redColor].CGColor;\nview.layer.shadowOpacity = 1;\nview.layer.shadowOffset = CGSizeMake(0, 0);";
            view.layer.shadowColor = [UIColor redColor].CGColor;
            view.layer.shadowOpacity = 1;
            view.layer.shadowOffset = CGSizeMake(0, 0);
        }
        if (i == 3) {
            label.text = @"view.layer.shadowColor = [UIColor redColor].CGColor;\nview.layer.shadowOpacity = 1;\nview.layer.shadowOffset = CGSizeMake(3, 0);";
            view.layer.shadowColor = [UIColor redColor].CGColor;
            view.layer.shadowOpacity = 1;
            view.layer.shadowOffset = CGSizeMake(3, 0);
        }
        if (i == 4) {
            label.text = @"view.layer.shadowColor = [UIColor redColor].CGColor;\nview.layer.shadowOpacity = 1;\nview.layer.shadowOffset = CGSizeMake(-3, 0);";
            view.layer.shadowColor = [UIColor redColor].CGColor;
            view.layer.shadowOpacity = 1;
            view.layer.shadowOffset = CGSizeMake(-3, 0);
        }
        if (i == 5) {
            label.text = @"view.layer.shadowColor = [UIColor redColor].CGColor;\nview.layer.shadowOpacity = 1;\nview.layer.shadowPath = [UIBezierPath bezierPathWithRect:view.bounds].CGPath;";
            view.layer.shadowColor = [UIColor redColor].CGColor;
            view.layer.shadowOpacity = 1;
            view.layer.shadowPath = [UIBezierPath bezierPathWithRect:view.bounds].CGPath;
        }
    }
}




#pragma mark - 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
