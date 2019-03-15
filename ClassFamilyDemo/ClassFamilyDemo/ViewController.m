//
//  ViewController.m
//  ClassFamilyDemo
//
//  Created by 崔正清 on 2017/11/28.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    Class btn1Class = [btn1 class];
    Class btn2Class = [btn2 class];
    
    NSLog(@"===");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
