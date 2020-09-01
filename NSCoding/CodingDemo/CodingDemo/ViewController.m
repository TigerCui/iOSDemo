//
//  ViewController.m
//  CodingDemo
//
//  Created by 崔正清 on 2020/8/10.
//  Copyright © 2020 czq. All rights reserved.
//

#import "ViewController.h"
#import "CZQObjc1.h"
#import "CZQObjc2.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (nonatomic, strong) NSObject *a;

@property (nonatomic, strong) CZQObjc1 *objc1;
@property (nonatomic, strong) CZQObjc2 *objc2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.objc1 = [CZQObjc1 new];
    self.objc2 = [CZQObjc2 new];
    
    [self.objc1 addObserver:self forKeyPath:@"a" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    Class objc1NewClass = object_getClass(self.objc1);
    id tempObjc = [[objc1NewClass alloc] init];
    NSLog(@"%@",objc1NewClass);
    NSLog(@"%@",tempObjc);
    NSLog(@"%@",[tempObjc class]);
    
    NSLog(@"%@",object_getClass(self.objc1));
    NSLog(@"%@",object_getClass(self.objc2));
    // Do any additional setup after loading the view.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
}

@end
