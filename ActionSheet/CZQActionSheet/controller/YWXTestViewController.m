//
//  YWXTestViewController.m
//  10000sApp
//
//  Created by 崔正清 on 16/2/2.
//  Copyright © 2016年 Kejin. All rights reserved.
//

#import "YWXTestViewController.h"
#import "PaymentTermsView.h"

@interface YWXTestViewController ()<PaymentTermsViewDelegate>

@end

@implementation YWXTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)btn:(id)sender {
    PaymentTermsView  *paymentTermsView = [PaymentTermsView shardPaymetTermsViewWithData:[self setupData]];
    paymentTermsView.delegate = self;
    [paymentTermsView show];
}

- (NSDictionary *)setupData {
    NSDictionary *dataList = @{
                               @"total_fee":@20,
                               @"payment_terms":@[
                                       @{
                                           @"image_name":@"ali_pay_icon",
                                           @"payment_term":@"支付宝支付",
                                           @"default_selected_imgName":@"selected_icon"},
                                       @{
                                           @"image_name":@"uiion_pay_icon",
                                           @"payment_term":@"银联支付",
                                           @"default_selected_imgName":@"unselected_icon"
                                           },
                                       @{
                                           @"image_name":@"wechat_pay_icon",
                                           @"payment_term":@"微信支付",
                                           @"default_selected_imgName":@"unselected_icon"
                                           }
                                       ]
                            };
    return dataList;
}

- (void)returnByValue:(NSString *)paymentTerm {
    NSLog(@"%@",paymentTerm);
}

@end
