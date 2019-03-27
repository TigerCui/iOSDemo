//
//  CZQGrabCallStack.m
//  GrabCallStack
//
//  Created by 崔正清 on 2019/3/15.
//  Copyright © 2019 cuizhengqing. All rights reserved.
//

#import "CZQGrabCallStack.h"
#import "BSBacktraceLogger.h"

static NSTimer *timer;

@implementation CZQGrabCallStack

+ (void)grabMainThreadCallStack {
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"%@",[BSBacktraceLogger bs_backtraceOfMainThread]);
    }];
    [timer fire];
}

+ (void)stop {
    [timer invalidate];
    timer = nil;
}

@end
