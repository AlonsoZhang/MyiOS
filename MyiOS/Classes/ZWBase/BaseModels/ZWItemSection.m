//
//  ZWItemSection.m
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "ZWItemSection.h"


@implementation ZWItemSection

+ (instancetype)sectionWithItems:(NSArray<ZWWordItem *> *)items andHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle
{
    ZWItemSection *item = [[self alloc] init];
    if (items.count) {
        [item.items addObjectsFromArray:items];
    }
    //    item.items = items;
    
    item.headerTitle = headerTitle;
    item.footerTitle = footerTitle;
    
    return item;
}
- (NSMutableArray<ZWWordItem *> *)items
{
    if(!_items)
    {
        _items = [NSMutableArray array];
    }
    return _items;
}
@end
