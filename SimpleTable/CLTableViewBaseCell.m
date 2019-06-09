//
//  CLTableViewBaseCell.m
//  SimpleTable
//
//  Created by 张宏伟 on 2019/5/3.
//  Copyright © 2019年 张宏伟. All rights reserved.
//

#import "CLTableViewBaseCell.h"

@implementation CLTableViewBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/ 255.f green:arc4random_uniform(256)/ 255.f blue:arc4random_uniform(256)/ 255.f alpha:1.f];
    }
    return self;
}
+ (NSNumber *)heightForItem:(id)item{
    return @(56);
}

+ (NSString *)sl_viewIdentifier{
    return NSStringFromClass(self);
}

- (void)updateItem:(NSString *)item{
    self.textLabel.text = item;
}


@end
