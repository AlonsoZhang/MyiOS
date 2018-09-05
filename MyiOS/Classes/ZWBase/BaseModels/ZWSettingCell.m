//
//  ZWSettingCell.m
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "ZWSettingCell.h"
#import "ZWWordItem.h"
#import "ZWWordArrowItem.h"
#import "ZWItemSection.h"


@interface ZWSettingCell ()

@end

@implementation ZWSettingCell

static NSString *const ID = @"cellSetting";
+ (instancetype)cellWithTableView:(UITableView *)tableView andCellStyle:(UITableViewCellStyle)style
{
    ZWSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil)
    {
        cell = [[self alloc] initWithStyle:style reuseIdentifier:ID];
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupBaseSettingCellUI];
    }
    
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setupBaseSettingCellUI];
}


- (void)setupBaseSettingCellUI
{
    self.detailTextLabel.numberOfLines = 0;
}

- (void)setItem:(ZWWordItem *)item
{
    _item = item;
    
    [self fillData];
    
    [self changeUI];
}

- (void)fillData
{
    self.textLabel.text = self.item.title;
    self.detailTextLabel.text = self.item.subTitle;
    //    self.imageView.image = self.item.image;
    
    /** 左边的图片 UIImage 或者 NSURL 或者 URLString 或者 ImageName */
    if ([self.item.image isKindOfClass:[UIImage class]]) {
        self.imageView.image = self.item.image;
    }else if ([self.item.image isKindOfClass:[NSURL class]]) {
        [self.imageView sd_setImageWithURL:self.item.image];
    }else if ([self.item.image isKindOfClass:[NSString class]]) {
        
        if ([self.item.image hasPrefix:@"http://"] || [self.item.image hasPrefix:@"https://"] || [self.item.image hasPrefix:@"file://"]) {
            
            NSString *imageUrl = [self.item.image stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
            [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
        }else {
            self.imageView.image = [UIImage imageNamed:self.item.image];
        }
    }
}

- (void)changeUI
{
    self.textLabel.font = self.item.titleFont;
    self.textLabel.textColor = self.item.titleColor;
    
    self.detailTextLabel.font = self.item.subTitleFont;
    self.detailTextLabel.textColor = self.item.subTitleColor;
    self.detailTextLabel.numberOfLines = self.item.subTitleNumberOfLines;
    
    if ([self.item isKindOfClass:[ZWWordArrowItem class]]) {
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }else
    {
        self.accessoryType = UITableViewCellAccessoryNone;
    }
    
    if (self.item.itemOperation || [self.item isKindOfClass:[ZWWordArrowItem class]]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
    }else
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
}



@end
