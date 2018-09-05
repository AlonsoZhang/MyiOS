//
//  ZWStaticTableViewController.h
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "ZWTableViewController.h"
#import "ZWItemSection.h"
#import "ZWWordItem.h"
#import "ZWWordArrowItem.h"



// 继承自这个基类, 设置组模型就行了, 详见Me模块的FinacialVC-Demo
@interface ZWStaticTableViewController : ZWTableViewController

// 需要把组模型添加到数据中
@property (nonatomic, strong) NSMutableArray<ZWItemSection *> *sections;


// 自定义某一行cell的时候调用super, 返回为空
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath NS_REQUIRES_SUPER;
- (ZWStaticTableViewController *(^)(ZWWordItem *item))addItem;
@end



UIKIT_EXTERN const UIEdgeInsets tableViewDefaultSeparatorInset;
UIKIT_EXTERN const UIEdgeInsets tableViewDefaultLayoutMargins;
