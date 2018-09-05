//
//  ZWTableViewController.m
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "ZWTableViewController.h"

@interface ZWTableViewController ()
/** <#digest#> */
@property (nonatomic, assign) UITableViewStyle tableViewStyle;
@end

@implementation ZWTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupBaseTableViewUI];
    
}

- (void)setupBaseTableViewUI
{
    self.tableView.backgroundColor = self.view.backgroundColor;
    
    
    if ([self.parentViewController isKindOfClass:[UINavigationController class]]) {
        self.tableView.contentInset  = UIEdgeInsetsMake(64, 0, 0, 0);
        
        if ([self respondsToSelector:@selector(ZWNavigationHeight:)]) {
            NSLog(@"%zd,%f",[self respondsToSelector:@selector(ZWNavigationHeight:)],[self ZWNavigationHeight:nil]);
            self.tableView.contentInset = UIEdgeInsetsMake([self ZWNavigationHeight:nil], 0, 0, 0);
        }
    }
    
    
}

#pragma mark - scrollDeleggate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    UIEdgeInsets contentInset = self.tableView.contentInset;
    contentInset.bottom -= self.tableView.mj_footer.ZW_height;
    self.tableView.scrollIndicatorInsets = contentInset;
    [self.view endEditing:YES];
}


#pragma mark - TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
}



- (UITableView *)tableView
{
    if(_tableView == nil)
    {
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:self.tableViewStyle];
        [self.view addSubview:tableView];
        
        tableView.delegate = self;
        tableView.dataSource = self;
        
        tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        _tableView = tableView;
    }
    return _tableView;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    if (self = [super init]) {
        _tableViewStyle = style;
    }
    
    return self;
}

- (void)dealloc
{
    
}

@end
