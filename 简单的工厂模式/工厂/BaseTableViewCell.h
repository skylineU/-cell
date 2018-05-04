//
//  BaseTableViewCell.h
//  MyProject
//
//  Created by yun on 2018/5/4.
//  Copyright © 2018年 yun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"


@interface BaseTableViewCell : UITableViewCell

// 布局
- (void)initSubviews;

// 赋值
- (void)assignmentOperation:(CellModel *)cellModel;

// 标识符
+ (NSString *)getReuseIdentifier;


@end
