//
//  ViewController.m
//  本地通知
//
//  Created by 崔正清 on 16/3/25.
//  Copyright © 2016年 cuizhengqing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)sendLocalNotification:(id)sender {
    //1.创建本地通知对象
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    
    //2.设置通知的一些属性
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];//10秒后发通知
    notification.alertBody = @"这是一条新的通知";
    notification.userInfo = @{@"name":@"张三",
                               @"age":@20
                              };
    notification.applicationIconBadgeNumber = 2;
    
    //3.将通知添加到应用程序的日程清单中
    UIApplication *application = [UIApplication sharedApplication];
    [application scheduleLocalNotification:notification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
