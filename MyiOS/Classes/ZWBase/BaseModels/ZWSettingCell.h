//
//  ZWSettingCell.h
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZWWordItem;

@interface ZWSettingCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView andCellStyle:(UITableViewCellStyle)style;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
/** 静态单元格模型 */
@property (nonatomic, strong)  ZWWordItem *item;

@end
