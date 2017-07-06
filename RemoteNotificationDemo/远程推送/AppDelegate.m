//
//  AppDelegate.m
//  远程推送
//
//  Created by 崔正清 on 16/3/23.
//  Copyright © 2016年 cuizhengqing. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
{
    NSDictionary *_userInfo;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if ([[UIDevice currentDevice].systemVersion doubleValue] <= 8.0) {//判断当前系统版本，下面的注册方法不适用于iOS8以后的系统
        //向服务器请求，要注册推送功能，以此获取到服务器返回的devicetoken
        //type用来说明支持的通知形式
        /*
        UIRemoteNotificationTypeNone
        UIRemoteNotificationTypeBadge 收到通知有徽章显示
        UIRemoteNotificationTypeSound 收到通知有声音提示
        UIRemoteNotificationTypeAlert 收到通知有横幅提示
        UIRemoteNotificationTypeNewsstandContentAvailability
         */
        [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeNewsstandContentAvailability];
    } else {//iOS8以后推送后通知的类型需要让用户自己设置
        //设置用户有哪几种模式可以设置
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:nil];
        [application registerUserNotificationSettings:settings];
        //申请使用通知
        [application registerForRemoteNotifications];
    }
    NSDictionary *userInfo = launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey];
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 40, 300, 200);
    label.numberOfLines = 0;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:24];
    label.backgroundColor = [UIColor blueColor];
    label.text =[NSString stringWithFormat:@"%@",userInfo];
    [self.window.rootViewController.view addSubview:label];
    return YES;
}

//只要获取到用户同意，则服务器端返回deviceToken
//会自动执行下面的方法
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(nonnull NSData *)deviceToken {
    NSLog(@"%@",deviceToken);
}

//用户点击了通知，进入到应用程序中，需要捕获到这个时机
//从而决定这一次进入应用程序时要执行什么动作，下面的方法就会在点击通知时自动调用
//1.应用程序在前台时：通知到，该方法自动执行
//2.应用程序在后台且没有退出时：通知到，只有点击了通知查看时，该方法自动执行
//3.应用程序退出后：通知到，点击查看通知，不会执行下面的didReceive方法，而是执行didFinishLauncing方法
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo {
    //为了测试在应用程序退出后，该方法是否执行
    //往第一个界面上添加一个label，看标签是否会显示一些内容
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 250, 300, 200);
    label.numberOfLines = 0;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:24];
    label.backgroundColor = [UIColor grayColor];
    label.text =[NSString stringWithFormat:@"%@",userInfo];
    [self.window.rootViewController.view addSubview:label];
}

/*
 此方法是新的用于响应远程推送通知的方法
 1.如果应用程序在后台，则通知到，点击查看，该方法自动执行
 2.如果应用程序在前台，则通知到，该方法自动执行
 3.如果应用程序被关闭，则通知到，点击查看，先执行didFinishLauncing方法，再执行该方法
 4.可以开启后台刷新数据的功能
    step1：点击target-->Capabilities-->Background Modes-->Remote Notification勾上
    step2：在给APNs服务器发送的要推送的信息中，添加一组字符：
        {"aps":{"content-available":"999","alert":"bbbbb.","badge":1}}
        其中content-available就是为了配合后台刷新而添加的内容，999可以随意定义
 */
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo fetchCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler {
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 250, 300, 200);
    label.numberOfLines = 0;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:24];
    label.backgroundColor = [UIColor grayColor];
    label.text =[NSString stringWithFormat:@"%@",userInfo];
    [self.window.rootViewController.view addSubview:label];
    
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    //NewData就是使用新的数据 更新界面，响应点击通知这个动作
    completionHandler(UIBackgroundFetchResultNewData);
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
