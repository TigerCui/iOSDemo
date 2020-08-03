//
//  main.m
//  BlockPrinciple
//
//  Created by 崔正清 on 2020/8/3.
//  Copyright © 2020 czq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
        //声明
        void(^block)(void) = ^ {
            //实现
            NSLog(@"Hello, World!");
        };
        //调用
        block();
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
