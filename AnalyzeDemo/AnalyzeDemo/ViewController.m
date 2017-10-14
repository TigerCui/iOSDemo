//
//  ViewController.m
//  AnalyzeDemo
//
//  Created by czq on 2017/10/14.
//  Copyright © 2017年 czq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


+(UIImage*)getSubImage:(unsigned long)ulUserHeader
{
    UIImage * sourceImage = [UIImage imageNamed:@"header.png"];
    CGFloat height = sourceImage.size.height;
    CGRect rect = CGRectMake(0 + ulUserHeader*height, 0, height, height);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([sourceImage CGImage], rect);
    UIImage* smallImage = [UIImage imageWithCGImage:imageRef];
    //CGImageRelease(imageRef);
    
    return smallImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
