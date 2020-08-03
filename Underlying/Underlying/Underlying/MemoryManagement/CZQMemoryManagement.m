//
//  CZQMemoryManagement.m
//  Underlying
//
//  Created by 崔正清 on 2020/7/26.
//  Copyright © 2020 czq. All rights reserved.
//

#import "CZQMemoryManagement.h"

@implementation CZQMemoryManagement

/**
 *  Tagged Pointe测试
 */
- (void)taggedPointeTest {
    NSNumber *number1 = @1;
    NSNumber *number2 = @2;
    NSNumber *number3 = @3;
    NSNumber *number4 = @4;
    NSNumber *number5 = @5;
    NSNumber *number6 = @6;
    NSNumber *number7 = @(pow(2.0, 54.0));
    NSNumber *number8 = @(pow(2.0, 55.0));
    
    NSLog(@"number1:%p",number1);
    NSLog(@"number2:%p",number2);
    NSLog(@"number3:%p",number3);
    NSLog(@"number4:%p",number4);
    NSLog(@"number5:%p",number5);
    NSLog(@"number6:%p",number6);
    NSLog(@"number7:%p",number7);
    NSLog(@"number8:%p",number8);
    
    NSLog(@"number1:%@",number1);
    NSLog(@"number2:%@",number2);
    NSLog(@"number3:%@",number3);
    NSLog(@"number4:%@",number4);
    NSLog(@"number5:%@",number5);
    NSLog(@"number6:%@",number6);
    NSLog(@"number7:%@",number7);
    NSLog(@"number8:%@",number8);
}

/**
 *  此方法会崩溃
 *  因为设置给name的值很大,已经超出了指针中所能存储的直接限制
 *  此时就需要调用name属性的set方法
 *  set方法的内部会调用[_name release]释放旧值
 *  在子线程中会有多个线程同时执行[_name release],这时就崩溃了
 */
- (void)taggedPointeTest1 {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    for (int i = 0; i < 1000; i++) {
        dispatch_async(queue, ^{
            self.name = [NSString stringWithFormat:@"asdasdsfafaffafgawfgquwegfqewfqfqwfqefqfcqefqefqerfqtgqfqedqerfqrfqedqrfrfqeqrfqrfafarfafewfqefqefgoqiufgouigfiouqgeftqiobfouqfgoiqwfoiqegfoqiuefouqyfgoiqwgfoiqubcdouqgoqiuer8107oqiugfoiqugfouqyfgroqrbfouqbcyldksajgfuriogfoiqrfdefafdfa"];
        });
    }
    NSLog(@"end");
}

/**
 *  此方法不会崩溃
 *  因为设置给name的值不够大可以直接存在指针中,此时不会调用name的set方法
 *  所以不会崩溃
 */
- (void)taggedPointeTest2 {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    for (int i = 0; i < 1000; i++) {
        dispatch_async(queue, ^{
            self.name = [NSString stringWithFormat:@"asd"];
        });
    }
    NSLog(@"end");
}

@end
