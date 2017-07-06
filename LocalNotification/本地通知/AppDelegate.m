//
//  AppDelegate.m
//  本地通知
//
//  Created by 崔正清 on 16/3/25.
//  Copyright © 2016年 cuizhengqing. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0) {//iOS8以后需要询问用户是否允许接收通知
        //一下代码回实现的效果是
        //第一次运行程序，系统弹出一个提示框
        //询问用户是否允许接收通知
        UIUserNotificationType noteType = UIUserNotificationTypeAlert | UIUserNotificationTypeSound | UIUserNotificationTypeBadge;
        UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:noteType categories:nil];
        [application registerUserNotificationSettings:setting];
    }
    
    //如果是因为点击查看了通知而启动了应用程序
    //那么通知的信息都会存在launchOptions参数中
    UILocalNotification *notification = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
    if (notification != nil) {//点通知进来的
        UILabel *label = [[UILabel alloc]init];
        label.frame = CGRectMake(0, 40, 300, 200);
        label.backgroundColor = [UIColor blueColor];
        label.numberOfLines = 0;
        label.font =[UIFont systemFontOfSize:30];
        label.textColor = [UIColor whiteColor];
        label.text = [NSString stringWithFormat:@"3333333%@",notification.userInfo];
        [self.window.rootViewController.view addSubview:label];
        [application setApplicationIconBadgeNumber:0];
    }
    return YES;
}


/*
 1.App在前台，通知到了，直接自动执行该方法
 2.App在后台，通知到了，点击查看通知，该方法才执行
 3.App已经退出，通知到了，点击查看通知，此方法不执行，但是didFinishLaunchingWithOptions方法一定会被执行，通知传入的参数也可以在launching方法中获取到
 */
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 250, 300, 200);
    label.backgroundColor = [UIColor grayColor];
    label.numberOfLines = 0;
    label.font =[UIFont systemFontOfSize:30];
    label.textColor = [UIColor whiteColor];
    //alertBody用于存储显示的通知的文字内容
    //uesrInfo用于存储额外要传递的通知内容
    label.text = [NSString stringWithFormat:@"%@",notification.userInfo];
    [self.window.rootViewController.view addSubview:label];
    //去掉应用程序图标中出现的红色数字提醒
    [application setApplicationIconBadgeNumber:0];
}










- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
