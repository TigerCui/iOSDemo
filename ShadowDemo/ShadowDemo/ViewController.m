//
//  ViewController.m
//  ShadowDemo
//
//  Created by 崔正清 on 2017/10/20.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "ViewController.h"
#import "SimpleShadowVC.h"
#import "ShadowColorVC.h"
#import "ShadowOpacityVC.h"
#import "ShadowOffsetVC.h"
#import "ShadowRadiusVC.h"
#import "ShadowPathVC.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *cellTitles;

@end

@implementation ViewController

static float kScreenWidth;
static float kScreenHeight;
//static float kStatusBarHeight;
//static float kNaviBarHeight;
//static float kItemWidth;
//static float kItemHeight;

static NSString * const kCellId = @"cellId";

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    kScreenWidth = [UIScreen mainScreen].bounds.size.width;
    kScreenHeight = [UIScreen mainScreen].bounds.size.height;
//    kStatusBarHeight = 20.0;
//    kNaviBarHeight = 20.0;
//    kItemWidth = kScreenWidth - 40.0;
//    kItemHeight = 88.0;
    [self p_setupSubViews];
}

#pragma mark - 懒加载数据
- (NSArray *)cellTitles {
    if (!_cellTitles) {
        _cellTitles = @[@"简单阴影",@"shadowColor",@"shadowOpacity",@"shadowOffset",@"shadowRadius",@"shadowPath"];
    }
    return _cellTitles;
}

#pragma mark - 设置子视图
- (void)p_setupSubViews {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
//    for (int i = 0; i < 6; i++) {
//        int row = i / 1;
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20 , 30 + (kItemHeight + 30) * row , kItemWidth, kItemHeight)];
//        [self.view addSubview:view];
//        view.backgroundColor = [UIColor lightGrayColor];
//        
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, view.bounds.size.width, view.bounds.size.height)];
//        [view addSubview:label];
//        label.font = [UIFont systemFontOfSize:14];
//        label.numberOfLines = 0;
//        
//        if (i == 0) {
//            label.text = @"view.layer.shadowColor = [UIColor redColor].CGColor;";
//            view.layer.shadowColor = [UIColor redColor].CGColor;
//        }
//        if (i == 1) {
//            label.text = @"view.layer.shadowColor = [UIColor redColor].CGColor;\nview.layer.shadowOpacity = 1;";
//            view.layer.shadowColor = [UIColor redColor].CGColor;
//            view.layer.shadowOpacity = 1;
//        }
//        if (i == 2) {
//            label.text = @"view.layer.shadowColor = [UIColor redColor].CGColor;\nview.layer.shadowOpacity = 1;\nview.layer.shadowOffset = CGSizeMake(0, 0);";
//            view.layer.shadowColor = [UIColor redColor].CGColor;
//            view.layer.shadowOpacity = 1;
//            view.layer.shadowOffset = CGSizeMake(0, 0);
//        }
//        if (i == 3) {
//            label.text = @"view.layer.shadowColor = [UIColor redColor].CGColor;\nview.layer.shadowOpacity = 1;\nview.layer.shadowOffset = CGSizeMake(3, 0);";
//            view.layer.shadowColor = [UIColor redColor].CGColor;
//            view.layer.shadowOpacity = 1;
//            view.layer.shadowOffset = CGSizeMake(3, 0);
//        }
//        if (i == 4) {
//            label.text = @"view.layer.shadowColor = [UIColor redColor].CGColor;\nview.layer.shadowOpacity = 1;\nview.layer.shadowOffset = CGSizeMake(-3, 0);";
//            view.layer.shadowColor = [UIColor redColor].CGColor;
//            view.layer.shadowOpacity = 1;
//            view.layer.shadowOffset = CGSizeMake(-3, 0);
//        }
//        if (i == 5) {
//            label.text = @"view.layer.shadowColor = [UIColor redColor].CGColor;\nview.layer.shadowOpacity = 1;\nview.layer.shadowPath = [UIBezierPath bezierPathWithRect:view.bounds].CGPath;";
//            view.layer.shadowColor = [UIColor redColor].CGColor;
//            view.layer.shadowOpacity = 1;
//            view.layer.shadowPath = [UIBezierPath bezierPathWithRect:view.bounds].CGPath;
//        }
//    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellId];
    }
    cell.textLabel.text = self.cellTitles[row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    UIViewController *vc;
    switch (row) {
        case 0:
        {
            vc = [[SimpleShadowVC alloc] init];
        }
            break;
        case 1:
        {
            vc = [[ShadowColorVC alloc] init];
        }
            break;
        case 2:
        {
            vc = [[ShadowOpacityVC alloc] init];
        }
            break;
        case 3:
        {
            vc = [[ShadowOffsetVC alloc] init];
        }
            break;
        case 4:
        {
            vc = [[ShadowRadiusVC alloc] init];
        }
            break;
        case 5:
        {
            vc = [[ShadowPathVC alloc] init];
        }
            break;
    }
    vc.title = self.cellTitles[row];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
