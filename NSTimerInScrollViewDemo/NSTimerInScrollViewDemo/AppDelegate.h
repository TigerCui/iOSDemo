//
//  AppDelegate.h
//  NSTimerInScrollViewDemo
//
//  Created by 崔正清 on 2017/9/25.
//  Copyright © 2017年 tc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

