//
//  ZWNewViewController.m
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "ZWNewViewController.h"
//#import "ZWAddressPickerViewController.h"
//#import "ZWNoNavBarViewController.h"
//#import "ZWAdaptFontViewController.h"
//#import "ZWBlankPageViewController.h"
//#import "ZWAnimationNavBarViewController.h"
//#import "ZWYYTextViewController.h"
//#import "ZWListExpandHideViewController.h"
//#import "ZWElementsCollectionViewController.h"
//#import "ZWVerticalLayoutViewController.h"
//#import "ZWHorizontalLayoutViewController.h"
//#import "ZWKeyboardHandleViewController.h"
//#import "ZWDownLoadFileViewController.h"
//#import "ZWMasonryViewController.h"
//#import "ZWBaiduMapViewController.h"
//#import "PoiSearchDemoViewController.h"
//#import "ZWQRCodeViewController.h"
//#import "ZWUpLoadImagesViewController.h"
//#import "ZWUpLoadProgressViewController.h"
//#import "ZWListTimerCountDownViewController.h"
//#import "ZWH5_OCViewController.h"
//#import "ZWAlertViewsViewController.h"
//#import "ZWFillTableFormViewController.h"
//////#import "ZWFaceRecognizeViewController.h"
//#import "ZWTableSDWebImageViewController.h"
//#import "ZWDragTableViewController.h"
//#import "ZWCalendarViewController.h"
//#import "ZWNavBarFadeViewController.h"
//#import "ZWFingerCheckViewController.h"
//#import "ZWDownLoadFileViewControllerTWO.h"
//#import "ZWOfflineDownloadViewController.h"
//
//#import "YFMarqueeViewController.h"
//#import "GZView.h"
//#import "YFCycleView.h"
@interface ZWNewViewController ()
@property (weak, nonatomic) UILabel *backBtn;
@property(nonatomic,strong) UIView *viewAnima; //装 滚动视图的容器
@property(nonatomic,weak) UILabel *customLab;

@end

@implementation ZWNewViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self positionAnimation];
    
    //关闭抽屉模式
    //    [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    
    //设置打开抽屉模式
    [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //    *******添加中间标题
//    [self addMiddleTitleView];
//    [self positionAnimation];
//
//    self.tableView.backgroundColor = [UIColor whiteColor];
//
//    [self.navigationController.tabBarItem setBadgeColor:[UIColor RandomColor]];
//
//    [self.navigationController.tabBarItem setBadgeValue:@"2"];
//
//    UIEdgeInsets edgeInsets = self.tableView.contentInset;
//    edgeInsets.bottom += self.tabBarController.tabBar.ZW_height;
//    self.tableView.contentInset = edgeInsets;
//    //    ZWWordArrowItem *item0 = [ZWWordArrowItem itemWithTitle:@"占位" subTitle: nil];
//    //    item0.destVc = [ZWLoggerViewController class];
//
//    ZWWordArrowItem *item1 = [ZWWordArrowItem itemWithTitle:@"省市区三级联动" subTitle: nil];
//
//    item1.destVc = [ZWAddressPickerViewController class];
//
//    ZWWordArrowItem *item2 = [ZWWordArrowItem itemWithTitle:@"没有导航栏全局返回(侧滑)" subTitle: nil];
//
//    item2.destVc = [ZWNoNavBarViewController class];
//
//    ZWWordArrowItem *item3 = [ZWWordArrowItem itemWithTitle:@"字体适配屏幕" subTitle: nil];
//
//    item3.destVc = [ ZWAdaptFontViewController class];
//
//    ZWWordArrowItem *item4 = [ZWWordArrowItem itemWithTitle:@"空白页展示" subTitle: nil];
//
//    item4.destVc = [ZWBlankPageViewController class];
//
//    ZWWordArrowItem *item5 = [ZWWordArrowItem itemWithTitle:@"导航条颜色或者高度渐变" subTitle: nil];
//
//    item5.destVc = [ZWAnimationNavBarViewController class];
//
//    ZWWordArrowItem *item6 = [ZWWordArrowItem itemWithTitle:@"关于 YYText 使用" subTitle: nil];
//
//    item6.destVc = [ZWYYTextViewController class];
//
//    ZWWordArrowItem *item7 = [ZWWordArrowItem itemWithTitle:@"列表的展开和收起" subTitle: nil];
//
//    item7.destVc = [ZWListExpandHideViewController class];
//
//    ZWWordArrowItem *item8 = [ZWWordArrowItem itemWithTitle:@"App首页 CollectionView 布局" subTitle: nil];
//
//    item8.destVc = [ZWElementsCollectionViewController class];
//
//    ZWWordArrowItem *item9 = [ZWWordArrowItem itemWithTitle:@"垂直流水布局" subTitle: nil];
//
//    item9.destVc = [ZWVerticalLayoutViewController class];
//
//
//    ZWWordArrowItem *item10 = [ZWWordArrowItem itemWithTitle:@"水平流水布局" subTitle: nil];
//
//    item10.destVc = [ZWHorizontalLayoutViewController class];
//
//    ZWWordArrowItem *item11 = [ZWWordArrowItem itemWithTitle:@"键盘处理" subTitle: nil];
//
//    item11.destVc = [ZWKeyboardHandleViewController class];
//
//    ZWWordArrowItem *item12 = [ZWWordArrowItem itemWithTitle:@"文件下载" subTitle: nil];
//    ZWWordArrowItem *item120 = [ZWWordArrowItem itemWithTitle:@"文件下载" subTitle: @"不重复下载服务器未更新文件"];
//    ZWWordArrowItem *item121 = [ZWWordArrowItem itemWithTitle:@"断点 缓存 下载" subTitle: nil];
//    item121.destVc = [ZWOfflineDownloadViewController class];
//    item12.destVc = [ZWDownLoadFileViewController class];
//    item120.destVc = [ZWDownLoadFileViewControllerTWO class];
//    ZWWordArrowItem *item13 = [ZWWordArrowItem itemWithTitle:@"Masonry 布局实例" subTitle: nil];
//
//    item13.destVc = [ZWMasonryViewController class];
//
//    ZWWordArrowItem *item15 = [ZWWordArrowItem itemWithTitle:@"百度地图" subTitle: nil];
//
//    item15.destVc = [ZWBaiduMapViewController class];
//
//    ZWWordArrowItem *item = [ZWWordArrowItem itemWithTitle:@"POI搜索" subTitle:nil];
//
//    item.destVc = [PoiSearchDemoViewController class];
//
//    ZWWordArrowItem *item16 = [ZWWordArrowItem itemWithTitle:@"二维码" subTitle: nil];
//
//    item16.destVc = [ZWQRCodeViewController class];
//
//    ZWWordArrowItem *item17 = [ZWWordArrowItem itemWithTitle:@"照片上传" subTitle: nil];
//
//    item17.destVc = [ZWUpLoadImagesViewController class];
//
//    ZWWordArrowItem *item18 = [ZWWordArrowItem itemWithTitle:@"照片上传有进度" subTitle: nil];
//
//    item18.destVc = [ZWUpLoadProgressViewController class];
//
//
//    ZWWordArrowItem *item19 = [ZWWordArrowItem itemWithTitle:@"列表倒计时" subTitle: nil];
//
//    item19.destVc = [ZWListTimerCountDownViewController class];
//
//    ZWWordArrowItem *item20 = [ZWWordArrowItem itemWithTitle:@"H5和 OC 交互" subTitle: nil];
//
//    item20.destVc = [ZWH5_OCViewController class];
//
//    ZWWordArrowItem *item21 = [ZWWordArrowItem itemWithTitle:@"自定义各种弹框" subTitle: nil];
//
//    item21.destVc = [ZWAlertViewsViewController class];
//
//    ZWWordArrowItem *item22 = [ZWWordArrowItem itemWithTitle:@"常见表单类型" subTitle: nil];
//
//    item22.destVc = [ZWFillTableFormViewController class];
//
//    //    ZWWordArrowItem *item23 = [ZWWordArrowItem itemWithTitle:@"人脸识别" subTitle: nil];
//    //    item23.destVc = [ZWFaceRecognizeViewController class];
//
//    ZWWordArrowItem *item24 = [ZWWordArrowItem itemWithTitle:@"列表加载图片" subTitle: @"SDWebImage"];
//
//    item24.destVc = [ZWTableSDWebImageViewController class];
//
//    ZWWordArrowItem *item25 = [ZWWordArrowItem itemWithTitle:@"列表拖拽" subTitle: @""];
//
//    item25.destVc = [ZWDragTableViewController class];
//
//    ZWWordArrowItem *item26 = [ZWWordArrowItem itemWithTitle:@"日历操作" subTitle: @""];
//
//    item26.destVc = [ZWCalendarViewController class];
//
//    ZWWordArrowItem *item27 = [ZWWordArrowItem itemWithTitle:@"导航条渐变" subTitle: @""];
//
//    item27.destVc = [ZWNavBarFadeViewController class];
//
//    ZWWordArrowItem *item28 = [ZWWordArrowItem itemWithTitle:@"指纹解锁" subTitle: @""];
//
//    item28.destVc = [ZWFingerCheckViewController class];
//
//    ZWItemSection *section0 = [ZWItemSection sectionWithItems:@[item1,item2,item3,item4,item5,item6,item7,item8,item9,item10,item11,item12,item120,item121,item13,item15,item,item16,item17,item18,item19,item20,item21,item22,item24,item25,item26,item27,item28] andHeaderTitle:@"静态单元格的头部标题" footerTitle:@"静态单元格的尾部标题"];
//
//    NSLog(@"%lu",(unsigned long)section0.items.count);
//    //弹出提示
//    [self showNewStatusesCount:section0.items.count];
//
//    [self.sections addObject:section0];
//    [self backBtn];
    
    
}

-(void)positionAnimation{
    
    //使用CABasicAnimation创建基础动画
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake((ZWScreenWidth+self.customLab.ZW_width/2)-100, 18)];
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(-self.customLab.ZW_width/2-20, 18)];
    anima.duration = 10.0f;
    //    anima.speed = 0.6;
    anima.repeatCount = 30;
    //    anima.repeatDuration = 60;
    //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
    //anima.fillMode = kCAFillModeForwards;
    //anima.removedOnCompletion = NO;
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [_customLab.layer addAnimation:anima forKey:@"positionAnimation"];
    
}



- (UIView *)ZWNavigationBarTitleView:(ZWNavigationBar *)navigationBar{
    
    return self.viewAnima;
}

//添加中间视图
-(void) addMiddleTitleView
{
    //定义视图大小
    UIView *viewAnima = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ZWScreenWidth, 40)];
    //    viewAnima.backgroundColor = [UIColor  blueColor];
    self.viewAnima = viewAnima;
    
    UILabel *customLab = [[UILabel alloc] init];
    //    customLab.backgroundColor = [UIColor yellowColor];
    customLab.frame = CGRectMake(ZWScreenWidth, 18, 300, 30);
    [customLab setTextColor:[UIColor redColor]];
    [customLab setText:@"自定义导航栏 View！(～￣▽￣)～"];
    customLab.font = [UIFont boldSystemFontOfSize:18];
    self.customLab = customLab;
    
    //添加视图
    [self.viewAnima addSubview:customLab];
}


#pragma mark 重写BaseViewController设置内容

- (UIColor *)ZWNavigationBackgroundColor:(ZWNavigationBar *)navigationBar
{
    return [UIColor whiteColor];
}
- (BOOL)ZWNavigationIsHideBottomLine:(ZWNavigationBar *)navigationBar
{
    return NO;
}

- (void)leftButtonEvent:(UIButton *)sender navigationBar:(ZWNavigationBar *)navigationBar
{
    NSLog(@"%s", __func__);
}

- (void)rightButtonEvent:(UIButton *)sender navigationBar:(ZWNavigationBar *)navigationBar
{
    NSLog(@"%s", __func__);
}

- (void)titleClickEvent:(UILabel *)sender navigationBar:(ZWNavigationBar *)navigationBar
{
    NSLog(@"%@", sender);
}

//- (NSMutableAttributedString*)ZWNavigationBarTitle:(ZWNavigationBar *)navigationBar
//{
//    return [self changeTitle:@"自定义导航栏 View"];
//}


- (UIImage *)ZWNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(ZWNavigationBar *)navigationBar
{
    [leftButton setTitle:@"左边" forState: UIControlStateNormal];
    [leftButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //    [leftButton setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    return nil;
}


- (UIImage *)ZWNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(ZWNavigationBar *)navigationBar
{
    //    rightButton.backgroundColor = [UIColor redColor];
    [rightButton setTitle:@"右边" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    //    [rightButton setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    return nil;
}



#pragma mark 自定义代码

-(NSMutableAttributedString *)changeTitle:(NSString *)curTitle
{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:curTitle ?: @""];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:16] range:NSMakeRange(0, title.length)];
    
    return title;
}


- (void)showNewStatusesCount:(NSInteger)count
{
    // 1.创建一个UILabel
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:12];
    
    // 2.显示文字
    if (count) {
        label.text = [NSString stringWithFormat:@"共有%ld条实例数据", count];
    } else {
        label.text = @"没有最新的数据";
    }
    
    // 3.设置背景
    label.backgroundColor = [UIColor colorWithRed:254/255.0  green:129/255.0 blue:0 alpha:1.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    
    // 4.设置frame
    label.width = self.view.frame.size.width;
    label.height = 35;
    label.ZW_x = 0;
    label.ZW_y = CGRectGetMaxY([self.navigationController navigationBar].frame) - label.frame.size.height;
    
    // 5.添加到导航控制器的view
    //[self.navigationController.view addSubview:label];
    [self.view insertSubview:label belowSubview:self.ZW_navgationBar];
    
    // 6.动画
    CGFloat duration = 0.75;
    //label.alpha = 0.0;
    [UIView animateWithDuration:duration animations:^{
        // 往下移动一个label的高度
        label.transform = CGAffineTransformMakeTranslation(0, label.frame.size.height);
        //label.alpha = 1.0;
    } completion:^(BOOL finished) { // 向下移动完毕
        
        // 延迟delay秒后，再执行动画
        CGFloat delay = 1.0;
        
        [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            // 恢复到原来的位置
            label.transform = CGAffineTransformIdentity;
            //label.alpha = 0.0;
            
        } completion:^(BOOL finished) {
            
            // 删除控件
            [label removeFromSuperview];
        }];
    }];
}


- (UILabel *)backBtn
{
    if(_backBtn == nil)
    {
        UILabel *btn = [[UILabel alloc] init];
        btn.text = @"点击返回";
        btn.textAlignment = NSTextAlignmentCenter;
        //        btn.font = BOLDSYSTEMFONT(15);
        //        btn.textColor = [UIColor blackColor];
        //        btn.backgroundColor = RGBA(220, 220, 220,1);
        
        //如果不是加图片就把注释的打开  图片的相关代码注释
        UIImage *img = [UIImage imageNamed:@"image3"];
        NSTextAttachment *textAttach = [[NSTextAttachment alloc]init];
        textAttach.image = img;
        textAttach.bounds = CGRectMake(0, 0, 70, 70);
        NSAttributedString * strA =[NSAttributedString attributedStringWithAttachment:textAttach];
        btn.attributedText = strA;
        
        //        btn.layer.cornerRadius = 35;
        //        btn.layer.borderWidth = 4;
        //        btn.layer.masksToBounds = YES;
        btn.userInteractionEnabled = YES;
        //        [btn sizeToFit];
        [btn setFrame:CGRectMake(20, 64, 70, 70)];
        
        ZWWeakSelf(self);
//        [btn addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
//            
//            if (weakself.presentedViewController) {
//                [weakself.presentedViewController dismissViewControllerAnimated:YES completion:nil];
//            }else{
//                [weakself.navigationController popViewControllerAnimated:YES];
//            }
//            
//        }];
        
        
        ZWWeakSelf(btn);
        [btn addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithActionBlock:^(UIPanGestureRecognizer  *_Nonnull sender) {
            
            //            NSLog(@"%@", sender);
            
            // 获取手势的触摸点
            // CGPoint curP = [pan locationInView:self.imageView];
            
            // 移动视图
            // 获取手势的移动，也是相对于最开始的位置
            CGPoint transP = [sender translationInView:weakbtn];
            
            weakbtn.transform = CGAffineTransformTranslate(weakbtn.transform, transP.x, transP.y);
            
            // 复位
            [sender setTranslation:CGPointZero inView:weakbtn];
            
            if (sender.state == UIGestureRecognizerStateEnded) {
                
                [UIView animateWithDuration:0.2 animations:^{
                    
                    weakbtn.mj_x = (weakbtn.
                                    mj_x - ZWScreenWidth / 2) > 0 ? (ZWScreenWidth - weakbtn.ZW_width - 20) : 20;
                    weakbtn.mj_y = weakbtn.mj_y > 80 ? weakbtn.mj_y : 80;
                }];
            }
            
        }]];
        
        
        
        [kKeyWindow addSubview:btn];
        
        _backBtn = btn;
    }
    return _backBtn;
}


@end
