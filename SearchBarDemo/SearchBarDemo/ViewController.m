//
//  ViewController.m
//  SearchBarDemo
//
//  Created by 浩云 on 2017/11/13.
//  Copyright © 2017年 HaoYunTech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UISearchBarDelegate,UISearchDisplayDelegate,UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setupSubViews];
}

#pragma mark - 设置子视图
- (void)p_setupSubViews {
    [self p_setupSearchBar];
}

//设置搜索栏
- (void)p_setupSearchBar {
    //搜索栏
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    [self.view addSubview:searchBar];
    searchBar.delegate = self;//设置代理
    
    //搜索结果展示
    UISearchDisplayController *searchDC = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchDC.searchResultsDataSource = self;//搜索结果数据源
    searchDC.searchResultsDelegate = self;//搜索展示代理
    searchDC.delegate = self;
}

#pragma mark - search bar delegate



#pragma mark - 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
