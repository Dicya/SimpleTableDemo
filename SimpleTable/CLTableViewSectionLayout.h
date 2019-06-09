//
//  CLTableViewSectionLayout.h
//  SimpleTable
//
//  Created by 张宏伟 on 2019/5/3.
//  Copyright © 2019年 张宏伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLTableViewViewLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface CLTableViewSectionLayout : NSObject

@property(strong, nonatomic) CLTableViewViewLayout *headerLayout;

@property(strong, nonatomic) CLTableViewViewLayout *footerLayout;

@property(strong, nonatomic) NSMutableArray <CLTableViewViewLayout *> *rowLayouts;

@end

NS_ASSUME_NONNULL_END
