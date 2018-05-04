//
//  Factory.m
//  MyProject
//
//  Created by yun on 2018/5/4.
//  Copyright © 2018年 yun. All rights reserved.
//

#import "Factory.h"

@implementation Factory

+ (BaseTableViewCell *)factoryClassifierWithType:(NSString *)cellType cellStyle:(UITableViewCellStyle)cellStyle reuseIdentifier:(NSString *)reuseIdentifier{

    if (!cellType || [cellType isEqualToString:@""]) {
        return nil;
    }

    Class class = NSClassFromString(cellType);
    BaseTableViewCell *cell = [[class alloc] initWithStyle:cellStyle reuseIdentifier:reuseIdentifier];
    if (cell) {
        return cell;
    }

    return nil;
}

+ (NSString *)getCellIdentifierWithType:(NSString *)cellType{

    if (!cellType || [cellType isEqualToString:@""]) {
        return nil;
    }

    Class class = NSClassFromString(cellType);

    return [class getReuseIdentifier];
}

@end
