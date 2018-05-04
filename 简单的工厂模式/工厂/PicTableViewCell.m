//
//  PicTableViewCell.m
//  MyProject
//
//  Created by yun on 2018/5/4.
//  Copyright © 2018年 yun. All rights reserved.
//

#import "PicTableViewCell.h"

@interface PicTableViewCell ()

@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UILabel *noteLabel;
@property (nonatomic,strong) UIImageView *imgV;

@end

@implementation PicTableViewCell

// 布局
- (void)initSubviews{
    _imgV = [[UIImageView alloc] init];
    _imgV.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_imgV];
    [_imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.size.mas_equalTo(CGSizeMake(110, 70));
    }];
    
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.font = [UIFont systemFontOfSize:18];
    _contentLabel.numberOfLines = 0;
    _contentLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
        make.left.mas_equalTo(30);
        make.right.equalTo(self.imgV.mas_left).offset(-30);
    }];
    
    _noteLabel = [[UILabel alloc] init];
    _noteLabel.font = [UIFont systemFontOfSize:14];
    _noteLabel.textColor = kHexColor(0x9B9B9B);
    [self.contentView addSubview:_noteLabel];
    [_noteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom).offset(15);
        make.left.equalTo(self.contentLabel.mas_left);
        make.right.equalTo(self.imgV.mas_left).offset(-30);
        make.bottom.mas_lessThanOrEqualTo(-30);
    }];
    
}

// 赋值
- (void)assignmentOperation:(CellModel *)cellModel{
    _imgV.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:cellModel.picture]]];
//    [_imgV sd_setImageWithURL:[NSURL URLWithString:cellModel.picture] placeholderImage:nil options:SDWebImageLowPriority];
    _contentLabel.text = cellModel.content;
    _noteLabel.text = cellModel.note;
}

// 标识符
+ (NSString *)getReuseIdentifier{
    return [NSString stringWithFormat:@"%@",self];
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
