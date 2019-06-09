//
//  CLTableViewViewLayout.m
//  SimpleTable
//
//  Created by 张宏伟 on 2019/5/3.
//  Copyright © 2019年 张宏伟. All rights reserved.
//

#import "CLTableViewViewLayout.h"

#import "CLTableViewBaseCell.h"
@import ObjectiveC.runtime;
@import ObjectiveC.message;

@interface CLTableViewViewLayout()

@property(assign, nonatomic) CGFloat height;

@end

@implementation CLTableViewViewLayout

- (instancetype)initWithItem:(id)item forItemViewClass:(Class)viewClass{
    if (self = [super init]) {
        _height = NSNotFound;
        _item = item;
        _viewIdentifier = NSStringFromClass(viewClass);
    }
    return self;
}

+ (instancetype)viewLayoutWithItem:(id)item forItemViewClass:(Class)viewClass{
    return [[self alloc] initWithItem:item forItemViewClass:viewClass];
}

+ (NSNumber *)heightForItem:(id)item{
    return @(0);
}
- (CGFloat)height{
    if (_height == NSNotFound) {
        SEL sel = @selector(heightForItem:);
        if (class_respondsToSelector(objc_getMetaClass(self.viewIdentifier.UTF8String), sel)) {
            NSNumber *height = objc_msgSend(objc_getClass(self.viewIdentifier.UTF8String), sel, self.item);
            _height = [height floatValue];
        }else{
            _height = 0;
        }
    }
    return _height;
}


- (void)updateLayoutForView:(UIView *)view{
    if ([view respondsToSelector:@selector(updateItem:)]) {
        [view performSelectorOnMainThread:@selector(updateItem:) withObject:self.item waitUntilDone:YES];
    }
}

@end
#pragma clang diagnostic push
#pragma clang diagnostic ignored "警告名称"

// 被夹在这中间的代码针对于此警告都会忽视不会显示出来

//常见警告的名称
//1, 声明变量未使用  "-Wunused-variable"
//2, 方法定义未实现  "-Wincomplete-implementation"
//3, 未声明的选择器  "-Wundeclared-selector"
//4, 参数格式不匹配  "-Wformat"
//5, 废弃掉的方法     "-Wdeprecated-declarations"
//6, 不会执行的代码  "-Wunreachable-code"

#pragma clang diagnostic pop
