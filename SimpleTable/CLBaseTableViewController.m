//
//  ViewController.m
//  SimpleTable
//
//  Created by 张宏伟 on 2019/5/2.
//  Copyright © 2019年 张宏伟. All rights reserved.
//

#import "CLBaseTableViewController.h"
@interface CLBaseTableViewController ()


@end

@implementation CLBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

#pragma mark - public methods
- (void)registerCellForResueClass:(NSArray <NSString *> *)cellClasses{
    for (NSString *cellClass in cellClasses) {
        [self.tableView registerClass:NSClassFromString(cellClass) forCellReuseIdentifier:cellClass];
    }
}

- (void)registerCellForReuseNib:(NSArray <NSDictionary <NSString *, UINib *> *> *)nibes{
    for (NSDictionary *dic in nibes) {
        [self.tableView registerNib:dic.allKeys.lastObject forCellReuseIdentifier:dic.allKeys.lastObject];
    }
}

- (void)registerHeaderFooterViewForReuseClass:(NSArray <NSString *> *)cellClasses{
    for (NSString *cellClass in cellClasses) {
        [self.tableView registerClass:NSClassFromString(cellClass) forHeaderFooterViewReuseIdentifier:cellClass];
    }
}

- (void)registerHeaderFooterViewForReuseNib:(NSArray <NSDictionary <NSString *, UINib *> *> *)nibes{
    for (NSDictionary *dic in nibes) {
        [self.tableView registerNib:dic.allKeys.lastObject forHeaderFooterViewReuseIdentifier:dic.allKeys.lastObject];
    }
}

#pragma mark - table view data source && delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sections.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CLTableViewSectionLayout *sectionLayout = self.sections[section];
    return sectionLayout.headerLayout.height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CLTableViewViewLayout *headerLayout = self.sections[section].headerLayout;
    UIView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerLayout.viewIdentifier];
    [headerLayout updateLayoutForView:header];
    return header;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    CLTableViewSectionLayout *sectionLayout = self.sections[section];
    return sectionLayout.footerLayout.height;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    CLTableViewViewLayout *footerLayout = self.sections[section].footerLayout;
    UIView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footerLayout.viewIdentifier];
    [footerLayout updateLayoutForView:footer];
    return footer;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sections[section].rowLayouts.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CLTableViewSectionLayout *sectinLayout = self.sections[indexPath.section];
    CLTableViewViewLayout *rowLayout = sectinLayout.rowLayouts[indexPath.row];
    return rowLayout.height;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CLTableViewViewLayout *rowLayout = self.sections[indexPath.section].rowLayouts[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rowLayout.viewIdentifier forIndexPath:indexPath];
    [rowLayout updateLayoutForView:cell];
    return cell;
}

#pragma mark - lazy load
- (NSMutableArray<CLTableViewSectionLayout *> *)sections{
    if (!_sections) {
        _sections = [NSMutableArray arrayWithCapacity:10];
    }
    return _sections;
}

- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}
@end
