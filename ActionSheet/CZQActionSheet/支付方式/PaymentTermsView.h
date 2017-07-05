//
//  PaymentTermsView.h
//  CZQActionSheet
//
//  Created by 崔正清 on 16/2/1.
//  Copyright © 2016年 cuizhengqing. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PaymentTermsViewDelegate <NSObject>

- (void)returnByValue:(NSString *)paymentTerm;

@end

@interface PaymentTermsView : UIView
@property (nonatomic ,weak)id<PaymentTermsViewDelegate> delegate;

+ (PaymentTermsView *)shardPaymetTermsViewWithData:(NSDictionary *)dataList;
- (void)show;
- (void)close;
@end
