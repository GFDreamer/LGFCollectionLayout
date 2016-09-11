//
//  LGFWidthLayout.h
//  LGFCollectionViewAutoLayout
//
//  Created by 吕桂峰 on 15/12/11.
//  Copyright © 2015年 吕桂峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LGFWidthLayout;
@protocol  LGFAutoLayoutDelegate <NSObject>

-(CGFloat)autoLayout:(LGFWidthLayout *)layout atIndexPath:(NSIndexPath *)indexPath;

@end

@interface LGFWidthLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) CGFloat columnMargin; //列间距
@property (nonatomic, assign) CGFloat  rowMargin;   // 行间距
@property (nonatomic, assign) UIEdgeInsets  sectionInsert;
@property (nonatomic, assign) CGFloat    itemHeight;    //item高度
@property (nonatomic, assign) id<LGFAutoLayoutDelegate> delegate;

@end
