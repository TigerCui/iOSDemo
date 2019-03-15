//
//  DPTableViewCell.m
//  DetePickerDemo
//
//  Created by 崔正清 on 2017/11/14.
//  Copyright © 2017年 tc. All rights reserved.
//

#import "DPTableViewCell.h"

@implementation DPTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)clickBtn:(UIButton *)sender {
    NSLog(@"2333333");
    [self p_setupPickerView];
}

- (void)p_setupPickerView {
    UIDatePicker *picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 300, [UIScreen mainScreen].bounds.size.width, 300)];
    picker.datePickerMode = UIDatePickerModeDateAndTime;
    picker.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    [picker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    [self.superview addSubview:picker];
}

- (void)dateChange:(UIDatePicker *)picker {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
