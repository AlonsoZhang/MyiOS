//
//  ZWItemSection.h
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZWWordItem;
@interface ZWItemSection : NSObject

/** <#digest#> */
@property (nonatomic, copy) NSString *headerTitle;

/** <#digest#> */
@property (nonatomic, copy) NSString *footerTitle;

/** <#digest#> */
//@property (nonatomic, strong) NSArray<ZWWordItem *> *items;
@property (nonatomic, strong) NSMutableArray<ZWWordItem *> *items;
+ (instancetype)sectionWithItems:(NSArray<ZWWordItem *> *)items andHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle;

@end
