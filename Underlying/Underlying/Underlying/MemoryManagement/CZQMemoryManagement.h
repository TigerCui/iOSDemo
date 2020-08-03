//
//  CZQMemoryManagement.h
//  Underlying
//
//  Created by 崔正清 on 2020/7/26.
//  Copyright © 2020 czq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CZQMemoryManagement : NSObject

@property (nonatomic, strong) NSString *name;

/**
 *  Tagged Pointe测试
 */
- (void)taggedPointeTest;

/**
 *  Tagged Pointe测试1
 *  此方法会崩溃
 */
- (void)taggedPointeTest1;

/**
 *  Tagged Pointe测试2
 *  此方法不会崩溃
 */
- (void)taggedPointeTest2;

@end

NS_ASSUME_NONNULL_END
