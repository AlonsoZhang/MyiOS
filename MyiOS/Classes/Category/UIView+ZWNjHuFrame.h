//
//  UIView+ZWNjHuFrame.h
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZWNjHuFrame)

@property (nonatomic) CGFloat ZW_x;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat ZW_y;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat ZW_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat ZW_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat ZW_width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat ZW_height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat ZW_centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat ZW_centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint ZW_origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  ZW_size;        ///< Shortcut for frame.size.

@end
