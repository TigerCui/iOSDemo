//
//  CZQActionSheet.m
//  CZQActionSheet
//
//  Created by 崔正清 on 16/2/1.
//  Copyright © 2016年 cuizhengqing. All rights reserved.
//

#import "CZQActionSheet.h"

#define ScreenHeight    [UIScreen mainScreen].bounds.size.height
#define ScreenWidth     [UIScreen mainScreen].bounds.size.width

static CZQActionSheet *czqActionSheet = nil;

@interface CZQActionSheet ()
{
    UIView *_backgroundView;
    UIView *_maskView;
    UIWindow *_window;
}
@property (nonatomic ,strong)UIView *containedView;
@end

@implementation CZQActionSheet

+ (CZQActionSheet *)shardCZQActionSheetWithContainedView:(UIView *)containedView {
    if (czqActionSheet == nil) {
        czqActionSheet = [[CZQActionSheet alloc] initWithFrame:containedView.frame];
        czqActionSheet.containedView = containedView;
        [czqActionSheet setupFrame];//初始化frame
        [czqActionSheet setupWindow];
        [czqActionSheet setupBackgroundView];//初始化背景
    }
    return czqActionSheet;
}


- (void)drawRect:(CGRect)rect {
}

- (void)setupFrame {
    self.frame = CGRectMake(0, ScreenHeight, self.frame.size.width, self.frame.size.height);
    [self addSubview:self.containedView];
}

- (void)setupWindow {
    _window = [UIApplication sharedApplication].keyWindow;
}

- (void)setupBackgroundView {
    _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    _backgroundView.backgroundColor = [UIColor blackColor];
    _backgroundView.alpha = 0.0f;
    [self addTapGRToBackgroundView];
    [_window addSubview:_backgroundView];
    [_window addSubview:self];
}

- (void)addTapGRToBackgroundView {
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackgroundView)];
    [_backgroundView addGestureRecognizer:tapGR];
}

- (void)tapBackgroundView {
    [self close];
}

- (void)show {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    self.frame = CGRectMake(0, ScreenHeight - self.frame.size.height, self.frame.size.width, self.frame.size.height);
    _backgroundView.alpha = 0.4;
    [UIView commitAnimations];
}

- (void)close {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    self.frame = CGRectMake(0, ScreenHeight, self.frame.size.width, self.frame.size.height);
    _backgroundView.alpha = 0.0;
    [UIView commitAnimations];
}

@end
