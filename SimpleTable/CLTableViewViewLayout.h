//
//  CLTableViewViewLayout.h
//  SimpleTable
//
//  Created by 张宏伟 on 2019/5/3.
//  Copyright © 2019年 张宏伟. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CLTableViewViewLayout : NSObject

@property(readonly, nonatomic) CGFloat height;

@property(readonly, nonatomic) NSString *viewIdentifier;

@property(readonly, nonatomic) id item;

- (void)updateLayoutForView:(UIView *)view;

- (instancetype)initWithItem:(id)item forItemViewClass:(Class)viewClass;

+ (instancetype)viewLayoutWithItem:(id)item forItemViewClass:(Class)viewClass;


@end

NS_ASSUME_NONNULL_END
