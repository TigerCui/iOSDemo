//
//  YPCity.h
//  YunPOS
//
//  Created by czq on 2018/1/18.
//  Copyright © 2018年 莫艳. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YPDistrict;

@interface YPCity : NSObject

#if MATCH
@property (nonatomic, assign) NSInteger ID;//邮政编码
#else
@property (nonatomic, strong) NSString *ID;//邮政编码
#endif
@property (nonatomic, strong) NSString *n;//名称
@property (nonatomic, copy) NSArray<YPDistrict *> *d;//区

@end
