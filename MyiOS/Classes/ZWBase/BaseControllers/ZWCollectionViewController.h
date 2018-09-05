//
//  ZWCollectionViewController.h
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "ZWBaseViewController.h"
#import "ZWElementsFlowLayout.h"
#import "ZWVerticalFlowLayout.h"
#import "ZWHorizontalFlowLayout.h"


@class ZWCollectionViewController;
@protocol ZWCollectionViewControllerDataSource <NSObject>

@required
// 需要返回对应的布局
- (UICollectionViewLayout *)collectionViewController:(ZWCollectionViewController *)collectionViewController layoutForCollectionView:(UICollectionView *)collectionView;

@end

@interface ZWCollectionViewController : ZWBaseViewController <UICollectionViewDelegate, UICollectionViewDataSource, ZWCollectionViewControllerDataSource>

/** <#digest#> */
@property (weak, nonatomic) UICollectionView *collectionView;

@end
