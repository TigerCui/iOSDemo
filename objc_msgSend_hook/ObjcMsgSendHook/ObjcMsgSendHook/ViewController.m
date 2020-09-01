//
//  ViewController.m
//  ObjcMsgSendHook
//
//  Created by 崔正清 on 2020/8/31.
//  Copyright © 2020 czq. All rights reserved.
//

#import "ViewController.h"
#import "SMCallTrace.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test2];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [SMCallTrace stop];
    [SMCallTrace save];
}


- (void)test2 {
    sleep(0.79);
    [self test3];
}

- (void)test3 {
    sleep(1.77);
}

@end
