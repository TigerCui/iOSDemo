//
//  TCTableView.h
//  DelegateInheritance
//
//  Created by czq on 2017/7/29.
//  Copyright © 2017年 czq. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TCTableViewDelegate <NSObject,UITableViewDelegate>

@end

@protocol TCTableViewDataSource <NSObject,UITableViewDataSource>

@end

@interface TCTableView : UITableView

@property (nonatomic, weak) id <TCTableViewDelegate> delegate;

@property (nonatomic, weak) id <TCTableViewDataSource> dataSource;

@end
