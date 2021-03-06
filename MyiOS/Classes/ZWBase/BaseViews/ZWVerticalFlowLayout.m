//
//  ZWVerticalFlowLayout.m
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "ZWVerticalFlowLayout.h"
#define ZWXX(x) floorf(x)
#define ZWXS(s) ceilf(s)

static const NSInteger ZW_Columns_ = 3;
static const CGFloat ZW_XMargin_ = 10;
static const CGFloat ZW_YMargin_ = 10;
static const UIEdgeInsets ZW_EdgeInsets_ = {20, 10, 10, 10};

@interface ZWVerticalFlowLayout()

/** 所有的cell的attrbts */
@property (nonatomic, strong) NSMutableArray *ZW_AtrbsArray;

/** 每一列的最后的高度 */
@property (nonatomic, strong) NSMutableArray *ZW_ColumnsHeightArray;

- (NSInteger)columns;

- (CGFloat)xMargin;

- (CGFloat)yMarginAtIndexPath:(NSIndexPath *)indexPath;

- (UIEdgeInsets)edgeInsets;

@end

@implementation ZWVerticalFlowLayout



/**
 *  刷新布局的时候回重新调用
 */
- (void)prepareLayout
{
    [super prepareLayout];
    
    //如果重新刷新就需要移除之前存储的高度
    [self.ZW_ColumnsHeightArray removeAllObjects];
    
    //复赋值以顶部的高度, 并且根据列数
    for (NSInteger i = 0; i < self.columns; i++) {
        
        [self.ZW_ColumnsHeightArray addObject:@(self.edgeInsets.top)];
    }
    
    // 移除以前计算的cells的attrbs
    [self.ZW_AtrbsArray removeAllObjects];
    
    // 并且重新计算, 每个cell对应的atrbs, 保存到数组
    for (NSInteger i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++)
    {
        [self.ZW_AtrbsArray addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]]];
    }
    
    
    
}


/**
 *在这里边所处每个cell对应的位置和大小
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *atrbs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat w = 1.0 * (self.collectionView.frame.size.width - self.edgeInsets.left - self.edgeInsets.right - self.xMargin * (self.columns - 1)) / self.columns;
    
    w = ZWXX(w);
    
    // 高度由外界决定, 外界必须实现这个方法
    CGFloat h = [self.delegate waterflowLayout:self collectionView:self.collectionView heightForItemAtIndexPath:indexPath itemWidth:w];
    
    // 拿到最后的高度最小的那一列, 假设第0列最小
    NSInteger indexCol = 0;
    CGFloat minColH = [self.ZW_ColumnsHeightArray[indexCol] doubleValue];
    
    for (NSInteger i = 1; i < self.ZW_ColumnsHeightArray.count; i++)
    {
        CGFloat colH = [self.ZW_ColumnsHeightArray[i] doubleValue];
        if(minColH > colH)
        {
            minColH = colH;
            indexCol = i;
        }
    }
    
    
    CGFloat x = self.edgeInsets.left + (self.xMargin + w) * indexCol;
    
    CGFloat y = minColH + [self yMarginAtIndexPath:indexPath];
    
    // 是第一行
    if (minColH == self.edgeInsets.top) {
        
        y = self.edgeInsets.top;
    }
    
    // 赋值frame
    atrbs.frame = CGRectMake(x, y, w, h);
    
    // 覆盖添加完后那一列;的最新高度
    self.ZW_ColumnsHeightArray[indexCol] = @(CGRectGetMaxY(atrbs.frame));
    
    return atrbs;
}


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.ZW_AtrbsArray;
}


- (CGSize)collectionViewContentSize
{
    CGFloat maxColH = [self.ZW_ColumnsHeightArray.firstObject doubleValue];
    
    for (NSInteger i = 1; i < self.ZW_ColumnsHeightArray.count; i++)
    {
        CGFloat colH = [self.ZW_ColumnsHeightArray[i] doubleValue];
        if(maxColH < colH)
        {
            maxColH = colH;
        }
    }
    
    return CGSizeMake(self.collectionView.frame.size.width, maxColH + self.edgeInsets.bottom);
}


- (NSMutableArray *)ZW_AtrbsArray
{
    if(_ZW_AtrbsArray == nil)
    {
        _ZW_AtrbsArray = [NSMutableArray array];
    }
    return _ZW_AtrbsArray;
}

- (NSMutableArray *)ZW_ColumnsHeightArray
{
    if(_ZW_ColumnsHeightArray == nil)
    {
        _ZW_ColumnsHeightArray = [NSMutableArray array];
    }
    return _ZW_ColumnsHeightArray;
}

- (NSInteger)columns
{
    if([self.delegate respondsToSelector:@selector(waterflowLayout:columnsInCollectionView:)])
    {
        return [self.delegate waterflowLayout:self columnsInCollectionView:self.collectionView];
    }
    else
    {
        return ZW_Columns_;
    }
}

- (CGFloat)xMargin
{
    if([self.delegate respondsToSelector:@selector(waterflowLayout:columnsMarginInCollectionView:)])
    {
        return [self.delegate waterflowLayout:self columnsMarginInCollectionView:self.collectionView];
    }
    else
    {
        return ZW_XMargin_;
    }
}

- (CGFloat)yMarginAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate respondsToSelector:@selector(waterflowLayout:collectionView:linesMarginForItemAtIndexPath:)])
    {
        return [self.delegate waterflowLayout:self collectionView:self.collectionView linesMarginForItemAtIndexPath:indexPath];
    }else
    {
        return ZW_YMargin_;
    }
}

- (UIEdgeInsets)edgeInsets
{
    if([self.delegate respondsToSelector:@selector(waterflowLayout:edgeInsetsInCollectionView:)])
    {
        return [self.delegate waterflowLayout:self edgeInsetsInCollectionView:self.collectionView];
    }
    else
    {
        return ZW_EdgeInsets_;
    }
}

- (id<ZWVerticalFlowLayoutDelegate>)delegate
{
    return (id<ZWVerticalFlowLayoutDelegate>)self.collectionView.dataSource;
}

- (instancetype)initWithDelegate:(id<ZWVerticalFlowLayoutDelegate>)delegate
{
    if (self = [super init]) {
        
    }
    return self;
}


+ (instancetype)flowLayoutWithDelegate:(id<ZWVerticalFlowLayoutDelegate>)delegate
{
    return [[self alloc] initWithDelegate:delegate];
}

@end
