//
//  ZWNormalRefreshHeader.m
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "ZWNormalRefreshHeader.h"

@implementation ZWNormalRefreshHeader


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUIOnce];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupUIOnce];
}

- (void)setupUIOnce
{
    
    self.automaticallyChangeAlpha = YES;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
}

@end
