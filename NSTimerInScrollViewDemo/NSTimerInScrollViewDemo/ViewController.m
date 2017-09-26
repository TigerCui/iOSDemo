//
//  ViewController.m
//  NSTimerInScrollViewDemo
//
//  Created by 崔正清 on 2017/9/25.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "ViewController.h"
#import "TestCellTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,assign) NSInteger time;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupTableView];
    [self setupTimer];
}


//设置tableView
- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"TestCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.timeLabel.text = [NSString stringWithFormat:@"%ld",_time];
    return cell;
}

/*
 *  设置run loop模式
 */
//- (void)setupTimer {
//    __weak typeof(self) weakself = self;
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.2 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        weakself.time += 1;
//        [weakself.tableView reloadData];
//    }];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
//    [timer fire];
//}

/*
 *  设置子线程
 */
- (void)setupTimer {
    //创建一个子线程
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //创建timer,并回调refreshData方法
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(refreshData) userInfo:nil repeats:YES];
        //将timer添加到新线程的runloop中
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
        //启动runloop
        [[NSRunLoop currentRunLoop] run];
    });
}

- (void)refreshData {
    __weak typeof(self) weakself = self;
    
    /*
     *  GCD方式回到主线程
     */
    //回到主线程
//    dispatch_async(dispatch_get_main_queue(), ^{
//        //刷新显示数据
//        weakself.time += 1;
//        [weakself.tableView reloadData];
//    });
    
    /*
     *  队列方式回到主线程
     */
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        //刷新显示数据
        weakself.time += 1;
        [weakself.tableView reloadData];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
