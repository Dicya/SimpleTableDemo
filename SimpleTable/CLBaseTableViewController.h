//
//  ViewController.h
//  SimpleTable
//
//  Created by 张宏伟 on 2019/5/2.
//  Copyright © 2019年 张宏伟. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CLTableViewSectionLayout.h"
#import "CLTableViewBaseCell.h"
#import "CLTableViewBaseSectionHeaderFooterView.h"


@interface CLBaseTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(strong, nonatomic) NSMutableArray <CLTableViewSectionLayout *> *sections;

- (void)registerCellForResueClass:(NSArray <NSString *> *)cellClasses;
- (void)registerCellForReuseNib:(NSArray <NSDictionary <NSString *, UINib *> *> *)nibes;

- (void)registerHeaderFooterViewForReuseClass:(NSArray <NSString *> *)cellClasses;
- (void)registerHeaderFooterViewForReuseNib:(NSArray <NSDictionary <NSString *, UINib *> *> *)nibes;
@end

