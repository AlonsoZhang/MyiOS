//
//  ZWStaticTableViewController.m
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "ZWStaticTableViewController.h"
#import "ZWSettingCell.h"

//const UIEdgeInsets tableViewDefaultSeparatorInset = {0, 15, 0, 0};
//const UIEdgeInsets tableViewDefaultLayoutMargins = {8, 8, 8, 8};

@interface ZWStaticTableViewController ()

@end

@implementation ZWStaticTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"self.tableView.separatorInset = %@, self.tableView.separatorInset = %@", NSStringFromUIEdgeInsets(self.tableView.separatorInset), NSStringFromUIEdgeInsets(self.tableView.layoutMargins));
    
    //    self.tableView.separatorInset = UIEdgeInsetsZero;
    //    self.tableView.layoutMargins = UIEdgeInsetsZero;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sections[section].items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZWWordItem *item = self.sections[indexPath.section].items[indexPath.row];
    
    ZWSettingCell *cell = [ZWSettingCell cellWithTableView:tableView andCellStyle:UITableViewCellStyleValue1];
    
    cell.item = item;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ZWWordItem *item = self.sections[indexPath.section].items[indexPath.row];
    
    // 普通的cell
    if(item.itemOperation)
    {
        item.itemOperation(indexPath);
        return;
    }
    
    // 带箭头的cell
    if([item isKindOfClass:[ZWWordArrowItem class]])
    {
        ZWWordArrowItem *arrowItem = (ZWWordArrowItem *)item;
        
        if(arrowItem.destVc)
        {
            UIViewController *vc = [[arrowItem.destVc alloc] init];
            vc.navigationItem.title = arrowItem.title;
            
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sections[section].headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return self.sections[section].footerTitle;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.sections[indexPath.section].items[indexPath.row].cellHeight;
}

- (NSMutableArray<ZWItemSection *> *)sections
{
    if(_sections == nil)
    {
        _sections = [NSMutableArray array];
    }
    return _sections;
}
- (ZWStaticTableViewController *(^)(ZWWordItem *))addItem {
    
    ZWWeakSelf(self);
    if (!self.sections.firstObject) {
        [self.sections addObject:[ZWItemSection sectionWithItems:@[] andHeaderTitle:nil footerTitle:nil]];
    }
    return  ^(ZWWordItem *item) {
        [weakself.sections.firstObject.items addObject:item];
        return weakself;
    };
}

- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

@end
