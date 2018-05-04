//
//  BaseTableViewCell.m
//  MyProject
//
//  Created by yun on 2018/5/4.
//  Copyright © 2018年 yun. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 布局
        [self initSubviews];
    }
    return self;
}

// 布局
- (void)initSubviews{
    // 空实现
}

// 赋值
- (void)assignmentOperation:(CellModel *)cellModel{
    // 空实现
}

// 标识符
+ (NSString *)getReuseIdentifier{
    // 空实现
    return nil;
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

