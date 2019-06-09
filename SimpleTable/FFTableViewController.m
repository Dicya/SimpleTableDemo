//
//  FFTableViewController.m
//  SimpleTable
//
//  Created by 张宏伟 on 2019/5/3.
//  Copyright © 2019年 张宏伟. All rights reserved.
//

#import "FFTableViewController.h"

@interface FFTableViewController ()

@end

@implementation FFTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i < 10; i++) {
        CLTableViewSectionLayout *sectionLayout = [[CLTableViewSectionLayout alloc] init];
        if (arc4random_uniform(100) % 2 ==0) {
            CLTableViewViewLayout *headerLayout = [CLTableViewViewLayout viewLayoutWithItem:[NSString stringWithFormat:@"This is header index %d", i] forItemViewClass:CLTableViewBaseSectionHeaderFooterView.class];
            sectionLayout.headerLayout = headerLayout;
        }
        
        if (arc4random_uniform(200) % 2 == 1) {
            CLTableViewViewLayout *footerLayout = [CLTableViewViewLayout viewLayoutWithItem:[NSString stringWithFormat:@"This is Footer index %d", i] forItemViewClass:CLTableViewBaseSectionHeaderFooterView.class];
            
            sectionLayout.footerLayout = footerLayout;
        }
        
        int count_row = arc4random_uniform(30);
        NSMutableArray *rowLayouts = [NSMutableArray arrayWithCapacity:count_row];
        for ( int j = 0; j <count_row ; j++) {
            CLTableViewViewLayout *rowLayout = [CLTableViewViewLayout viewLayoutWithItem:[NSString stringWithFormat:@"This Cell is in section %d  index %d", i, j] forItemViewClass:CLTableViewBaseCell.class];
            [rowLayouts addObject:rowLayout];
        }
        
        sectionLayout.rowLayouts = rowLayouts;
        
        [self.sections addObject:sectionLayout];
        
    }
    [self registerCellForResueClass:@[NSStringFromClass(CLTableViewBaseCell.class)]];
    [self registerHeaderFooterViewForReuseClass:@[
                                                  NSStringFromClass(CLTableViewBaseSectionHeaderFooterView.class)
                                                  ]];
    
    [self.tableView reloadData];
    
}



@end
