//
//  Factory.h
//  MyProject
//
//  Created by yun on 2018/5/4.
//  Copyright © 2018年 yun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseTableViewCell.h"

@interface Factory : NSObject

+ (BaseTableViewCell *)factoryClassifierWithType:(NSString *)cellType cellStyle:(UITableViewCellStyle)cellStyle reuseIdentifier:(NSString *)reuseIdentifier;

+ (NSString *)getCellIdentifierWithType:(NSString *)cellType;

@end
