//
//  ViewController.m
//  WeChatSharingDemo
//
//  Created by 崔正清 on 15/12/24.
//  Copyright © 2015年 cuizhengqing. All rights reserved.
//

#import "ViewController.h"
#import "WXApi.h"

@interface ViewController ()<WXApiDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setButton];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)setButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(120, 120, 120, 36)];
    [button setTitle:@"SharingTest" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(sendMessage) forControlEvents:UIControlEventTouchUpInside];
}

- (void)sendMessage {
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.text = @"TigerCui的测试消息，请忽略";
    req.bText = YES;
    req.scene = WXSceneSession;
    [WXApi sendReq:req];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
