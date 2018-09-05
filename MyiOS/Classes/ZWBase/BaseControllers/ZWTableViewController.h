//
//  ZWTableViewController.h
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "ZWBaseViewController.h"
#import "ZWNavUIBaseViewController.h"
@interface ZWTableViewController : ZWBaseViewController<UITableViewDelegate, UITableViewDataSource>

// 这个代理方法如果子类实现了, 必须调用super
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView NS_REQUIRES_SUPER;

/** <#digest#> */
@property (weak, nonatomic) UITableView *tableView;

// tableview的样式, 默认plain
- (instancetype)initWithStyle:(UITableViewStyle)style;

@end
