//
//  ZWTextViewController.h
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "ZWNavUIBaseViewController.h"

@class ZWTextViewController;
@protocol ZWTextViewControllerDataSource <NSObject>

@optional
- (UIReturnKeyType)textViewControllerLastReturnKeyType:(ZWTextViewController *)textViewController;

- (BOOL)textViewControllerEnableAutoToolbar:(ZWTextViewController *)textViewController;

- (NSArray <UIButton *> *)textViewControllerRelationButtons:(ZWTextViewController *)textViewController;

@end


@protocol ZWTextViewControllerDelegate <UITextViewDelegate, UITextFieldDelegate>

@optional
#pragma mark - 最后一个输入框点击键盘上的完成按钮时调用
- (void)textViewController:(ZWTextViewController *)textViewController inputViewDone:(id)inputView;



@end




@interface ZWTextViewController : ZWNavUIBaseViewController<ZWTextViewControllerDataSource, ZWTextViewControllerDelegate>

- (BOOL)textFieldShouldClear:(UITextField *)textField NS_REQUIRES_SUPER;
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string NS_REQUIRES_SUPER;
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text NS_REQUIRES_SUPER;
- (BOOL)textFieldShouldReturn:(UITextField *)textField NS_REQUIRES_SUPER;


@end




#pragma mark - design UITextField
IB_DESIGNABLE
@interface UITextField (ZWTextViewController)

@property (assign, nonatomic) IBInspectable BOOL isEmptyAutoEnable;

@end


@interface ZWTextViewControllerTextField : UITextField

@end
