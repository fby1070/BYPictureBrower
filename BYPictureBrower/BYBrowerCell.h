//
//  BYBrowerCell.h
//  BYPictureBrower
//
//  Created by fuby on 2018/8/8.
//  Copyright © 2018年 StarShare. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BYAsset;
@class BYBrowerCell;

@protocol BYBrowerCellDelegate <NSObject>

- (void)dismissWithRect:(CGRect)rect cell:(BYBrowerCell *)cell;
@end

@interface BYBrowerCell : UICollectionViewCell

@property (nonatomic, weak) id<BYBrowerCellDelegate> delegate;

- (void)bindAsset:(BYAsset *)asset;

- (void)setupGesture;
@end
