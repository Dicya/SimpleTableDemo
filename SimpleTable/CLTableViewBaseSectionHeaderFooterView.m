//
//  CLTableViewSectionHeaderView.m
//  SimpleTable
//
//  Created by 张宏伟 on 2019/5/3.
//  Copyright © 2019年 张宏伟. All rights reserved.
//

#import "CLTableViewBaseSectionHeaderFooterView.h"

@implementation CLTableViewBaseSectionHeaderFooterView

+ (NSNumber *)heightForItem:(id)item{
    NSLog(@"%s", __func__);
    return @(40);
}

+ (NSString *)sl_viewIdentifier{
    return NSStringFromClass(self);
}

- (void)updateItem:(NSString *)item{
    self.textLabel.text = item;
}

@end
