//
//  PaymentTermsView.m
//  CZQActionSheet
//
//  Created by 崔正清 on 16/2/1.
//  Copyright © 2016年 cuizhengqing. All rights reserved.
//

#import "PaymentTermsView.h"
#import "CZQActionSheet.h"
#import "YWXWalletRechargeConfirmPayDetailTitleTableViewCell.h"
#import "YWXWalletRechargeConfirmPayWayTableViewCell.h"

#define ScreenHeight    [UIScreen mainScreen].bounds.size.height
#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define RGBAColor(R, G, B, A)   [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:A]
#define BackgroundRed           RGBAColor(255, 67, 67, 1)

static PaymentTermsView *paymentTermsView = nil;

@interface PaymentTermsView ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_myTableView;
    NSArray *_paymentTerms;
    NSString *_totalFee;
    NSString *_paymentTermStr;
}
@property (nonatomic ,strong)CZQActionSheet *actionSheet;
@end

@implementation PaymentTermsView
#pragma mark - 初始化
+ (PaymentTermsView *)shardPaymetTermsViewWithData:(NSDictionary *)dataList{
    if (paymentTermsView == nil) {
        paymentTermsView = [[PaymentTermsView alloc] init];
        [paymentTermsView setupEntityWithDict:dataList];
        [paymentTermsView setupTableView];
        [paymentTermsView setupFrame];
        paymentTermsView.actionSheet = [CZQActionSheet shardCZQActionSheetWithContainedView:paymentTermsView];
    }
    return paymentTermsView;
}

- (void)drawRect:(CGRect)rect {
}

- (void)setupFrame {
    self.frame = _myTableView.frame;
    self.backgroundColor = [UIColor whiteColor];
    [paymentTermsView addSubview:_myTableView];
}

- (void)show {
    [_actionSheet show];
}

- (void)close {
    [_actionSheet close];
}

#pragma mark - 初始化模型
- (void)setupEntityWithDict:(NSDictionary *)dict {
    _paymentTerms = dict[@"payment_terms"];
    _totalFee = dict[@"total_fee"];
}

#pragma mark - 初始化tableview
- (void)setupTableView {
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 375) style:UITableViewStyleGrouped];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [_myTableView registerNib:[UINib nibWithNibName:@"YWXWalletRechargeConfirmPayDetailTitleTableViewCell" bundle:nil] forCellReuseIdentifier:@"YWXWalletRechargeConfirmPayDetailTitleTableViewCell"];
    [_myTableView registerNib:[UINib nibWithNibName:@"YWXWalletRechargeConfirmPayWayTableViewCell" bundle:nil] forCellReuseIdentifier:@"YWXWalletRechargeConfirmPayWayTableViewCell"];
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;//去掉分割线
    _myTableView.backgroundColor = [UIColor whiteColor];
    _myTableView.bounces = NO;
}

#pragma mark - <UITableViewDataSource,UITableViewDelegate>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _paymentTerms.count+2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YWXWalletRechargeConfirmPayDetailTitleTableViewCell *titleCell =  [tableView dequeueReusableCellWithIdentifier:@"YWXWalletRechargeConfirmPayDetailTitleTableViewCell"  ];
    YWXWalletRechargeConfirmPayWayTableViewCell *paywayCell = [tableView dequeueReusableCellWithIdentifier:@"YWXWalletRechargeConfirmPayWayTableViewCell"];
    UITableViewCell *totalCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    if (indexPath.row == 0) {
        titleCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return titleCell;
    } else if (indexPath.row == _paymentTerms.count+1) {
        totalCell.textLabel.text = @"需付款";
        totalCell.detailTextLabel.text = [NSString stringWithFormat:@"%@元",_totalFee];
        totalCell.textLabel.font = [UIFont systemFontOfSize:15.0f];
        totalCell.textLabel.textColor = RGBAColor(102, 102, 102, 1);
        totalCell.detailTextLabel.font = [UIFont systemFontOfSize:15.0f];
        totalCell.detailTextLabel.textColor = RGBAColor(102, 102, 102, 1);
        totalCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return totalCell;
    } else {
        NSDictionary *data = _paymentTerms[indexPath.row - 1];
        paywayCell.mainImageView.image = [UIImage imageNamed:data[@"image_name"]];
        paywayCell.titleLabel.text = data[@"payment_term"];
        paywayCell.selectedImageView.image = [UIImage imageNamed:data[@"default_selected_imgName"]];
        if ([data[@"default_selected_imgName"] isEqualToString:@"selected_icon"]) {
            _paymentTermStr = data[@"payment_term"];
        }
        return paywayCell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 64;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
    view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"确认支付" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:18.0f];
    button.titleLabel.textColor = [UIColor whiteColor];
    [button setTintColor:[UIColor whiteColor]];
    button.frame = CGRectMake(0, 0, 300, 42);
    button.center = CGPointMake(ScreenWidth/2, (view.frame.size.height - (button.frame.size.height/2)));
    [button setBackgroundColor:BackgroundRed];
    button.layer.cornerRadius = 2.0f;
    [button addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YWXWalletRechargeConfirmPayWayTableViewCell *paywayCell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.row > 0 && indexPath.row < _paymentTerms.count + 1) {
        for (NSInteger i = 1; i < _paymentTerms.count + 1; i++) {
            NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:i inSection:0];
            YWXWalletRechargeConfirmPayWayTableViewCell *paywayCell = [tableView cellForRowAtIndexPath:selectedIndexPath];
            paywayCell.selectedImageView.image = [UIImage imageNamed:@"unselected_icon"];
        }
        paywayCell.selectedImageView.image = [UIImage imageNamed:@"selected_icon"];
        _paymentTermStr = paywayCell.titleLabel.text;
    }
}

#pragma mark - 确认支付按钮
- (void)action {
    if ([self.delegate respondsToSelector:@selector(returnByValue:)]) {
        [self.delegate returnByValue:_paymentTermStr];
    }
    [_actionSheet close];
}


@end
