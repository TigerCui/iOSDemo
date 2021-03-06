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
        
        
        void(^block)(void) = ^{};
        NSLog(@"%@",block);
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
        NSLog(@"%@",block);
        
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
