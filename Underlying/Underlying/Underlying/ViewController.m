//
//  ViewController.m
//  Underlying
//
//  Created by 崔正清 on 2020/7/26.
//  Copyright © 2020 czq. All rights reserved.
//

#import "ViewController.h"
#import "CZQMemoryManagement.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CZQMemoryManagement *memoryManagement = [CZQMemoryManagement new];
    [memoryManagement taggedPointeTest2];
}


@end
