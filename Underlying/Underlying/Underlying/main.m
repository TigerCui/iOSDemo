//
//  main.m
//  Underlying
//
//  Created by 崔正清 on 2020/7/26.
//  Copyright © 2020 czq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
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
