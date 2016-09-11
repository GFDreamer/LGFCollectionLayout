//
//  LGFWidthLayout.m
//  LGFCollectionViewAutoLayout
//
//  Created by 吕桂峰 on 15/12/11.
//  Copyright © 2015年 吕桂峰. All rights reserved.
//

#import "LGFWidthLayout.h"


@interface LGFWidthLayout ()
@property (nonatomic, assign) CGFloat   currentX; // 记录当前item的X坐标
@property (nonatomic, assign) CGFloat   currentY; // 记录当前item的Y坐标
@property (nonatomic, assign) CGFloat   currentMaxX; // 记录当前行row中item的最大X坐标
@property (nonatomic, strong) NSMutableArray  *attributedAry; //记录每个item的布局属性
@end
@implementation LGFWidthLayout

-(instancetype)init
{
    self = [super init];
    if ( self) {
        self.rowMargin = 6;
        self.columnMargin = 6;
        self.sectionInsert = UIEdgeInsetsMake(16, 16, 16, 16);
        self.itemHeight = 24;
    }
    return self;
}


-(NSMutableArray *)attributedAry
{
    if (_attributedAry == nil) {
        _attributedAry = [NSMutableArray array];
    }
    return _attributedAry;
}

-(void)prepareLayout
{
    self.currentX = self.sectionInsert.left;
    self.currentY = self.sectionInsert.top;
    self.currentMaxX = self.currentX;
    [self.attributedAry removeAllObjects];
    NSInteger count = [self.collectionView  numberOfItemsInSection:0 ];
    for (int i = 0; i < count; i++) {
        UICollectionViewLayoutAttributes    *atr = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [self.attributedAry addObject:atr];
    }
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    CGRect oldBounds = self.collectionView.bounds;
    if (CGRectGetWidth(oldBounds) != CGRectGetWidth(newBounds)) {
        
        return YES;
    }else
    {
        return  NO;
    }
}


-(CGSize)collectionViewContentSize
{
    UICollectionViewLayoutAttributes    *atr = self.attributedAry.lastObject;
    CGRect frame = atr.frame;
    CGFloat height = CGRectGetMaxY(frame) + self.sectionInsert.bottom   ;
    return CGSizeMake(0, height);
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat itemW = [self.delegate autoLayout:self atIndexPath:indexPath];
    UICollectionViewLayoutAttributes *atr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    atr.frame = CGRectMake(self.currentX, self.currentY, itemW, self.itemHeight);
    
    self.currentMaxX = self.currentX + itemW + self.sectionInsert.right;
    if (self.currentMaxX - screenW > 0) {
        self.currentX = self.sectionInsert.left;
        self.currentY = self.currentY + self.itemHeight + self.rowMargin;
        atr.frame = CGRectMake(self.currentX, self.currentY, itemW, self.itemHeight);
        self.currentX = self.currentX + itemW + self.columnMargin; // 下一个item的x坐标
    }else
    {
        self.currentX = self.currentX + itemW + self.columnMargin; // 下一个item的x坐标
    }
    return atr;
}


-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attributedAry;
}

@end
