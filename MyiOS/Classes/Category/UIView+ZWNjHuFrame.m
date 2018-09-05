//
//  UIView+ZWNjHuFrame.m
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "UIView+ZWNjHuFrame.h"

@implementation UIView (ZWNjHuFrame)

- (CGFloat)ZW_x {
    return self.frame.origin.x;
}

- (void)setZW_x:(CGFloat)ZW_x {
    CGRect frame = self.frame;
    frame.origin.x = ZW_x;
    self.frame = frame;
}

- (CGFloat)ZW_y {
    return self.frame.origin.y;
}

- (void)setZW_y:(CGFloat)ZW_y {
    CGRect frame = self.frame;
    frame.origin.y = ZW_y;
    self.frame = frame;
}

- (CGFloat)ZW_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setZW_right:(CGFloat)ZW_right {
    CGRect frame = self.frame;
    frame.origin.x = ZW_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)ZW_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setZW_bottom:(CGFloat)ZW_bottom {
    
    CGRect frame = self.frame;
    
    frame.origin.y = ZW_bottom - frame.size.height;
    
    self.frame = frame;
}

- (CGFloat)ZW_width {
    return self.frame.size.width;
}

- (void)setZW_width:(CGFloat)ZW_width {
    CGRect frame = self.frame;
    frame.size.width = ZW_width;
    self.frame = frame;
}

- (CGFloat)ZW_height {
    return self.frame.size.height;
}

- (void)setZW_height:(CGFloat)ZW_height {
    CGRect frame = self.frame;
    frame.size.height = ZW_height;
    self.frame = frame;
}

- (CGFloat)ZW_centerX {
    return self.center.x;
}

- (void)setZW_centerX:(CGFloat)ZW_centerX {
    self.center = CGPointMake(ZW_centerX, self.center.y);
}

- (CGFloat)ZW_centerY {
    return self.center.y;
}

- (void)setZW_centerY:(CGFloat)ZW_centerY {
    self.center = CGPointMake(self.center.x, ZW_centerY);
}

- (CGPoint)ZW_origin {
    return self.frame.origin;
}

- (void)setZW_origin:(CGPoint)ZW_origin {
    CGRect frame = self.frame;
    frame.origin = ZW_origin;
    self.frame = frame;
}

- (CGSize)ZW_size {
    return self.frame.size;
}

- (void)setZW_size:(CGSize)ZW_size {
    CGRect frame = self.frame;
    frame.size = ZW_size;
    self.frame = frame;
}

@end
