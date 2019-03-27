//
//  CZQGrabCallStack.h
//  GrabCallStack
//
//  Created by 崔正清 on 2019/3/15.
//  Copyright © 2019 cuizhengqing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZQGrabCallStack : NSObject

+ (void)grabMainThreadCallStack;

+ (void)stop;

@end

