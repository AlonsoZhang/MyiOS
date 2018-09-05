//
//  ZWRefreshTableViewController.h
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "ZWTableViewController.h"
#import "ZWAutoRefreshFooter.h"
#import "ZWNormalRefreshHeader.h"

@interface ZWRefreshTableViewController : ZWTableViewController

- (void)loadMore:(BOOL)isMore;


// 结束刷新, 子类请求报文完毕调用
- (void)endHeaderFooterRefreshing;

@end
