//
//  ViewController.m
//  KVODemo
//
//  Created by 崔正清 on 2020/8/11.
//  Copyright © 2020 czq. All rights reserved.
//

#import "ViewController.h"
#import "Objc.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (nonatomic, strong) Objc *objc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Class class1 = object_getClass(self.objc);
    NSLog(@"监听前objc类型object_getClass:%@",object_getClass(class1));
    IMP imp1 = method_getImplementation(class_getInstanceMethod(class1, @selector(setTest:)));
    NSLog(@"监听前objc的class实现地址:%p",imp1);
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld | NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionPrior;
    [self.objc addObserver:self forKeyPath:@"test" options:options context:@"context"];
    Class class2 = object_getClass(self.objc);
    NSLog(@"监听前objc类型object_getClass:%@",object_getClass(class2));
    IMP imp2 = method_getImplementation(class_getInstanceMethod(class2, @selector(setTest:)));
    NSLog(@"监听前objc的class实现地址:%p",imp2);
    NSLog(@"");
//    [self.objc willChangeValueForKey:@"test"];
//    [self.objc didChangeValueForKey:@"test"];
//    self.objc.test = @"1";
}

- (Objc *)objc {
    if (!_objc) {
        _objc = [Objc new];
    }
    return _objc;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"");
//    NSLog(@"keyPath:%@",keyPath);
//    NSLog(@"object:%@",object);
//    NSLog(@"change:%@",change);
//    NSLog(@"context:%@",context);
}

- (void)dealloc {
    [self.objc removeObserver:self forKeyPath:@"test"];
}


@end
