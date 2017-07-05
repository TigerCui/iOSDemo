//
//  CZQActionSheet.h
//  CZQActionSheet
//
//  Created by 崔正清 on 16/2/1.
//  Copyright © 2016年 cuizhengqing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CZQActionSheet : UIView

+ (CZQActionSheet *)shardCZQActionSheetWithContainedView:(UIView *)containedView;

- (void)show;

- (void)close;

@end
