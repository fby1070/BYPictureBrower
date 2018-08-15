//
//  BYBrowerCell.h
//  BYPictureBrower
//
//  Created by fuby on 2018/8/8.
//  Copyright © 2018年 StarShare. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BYAsset;

@protocol BYBrowerCellDelegate <NSObject>

- (void)pictureOneClick:(UITapGestureRecognizer *)recognizer;
@end

@interface BYBrowerCell : UICollectionViewCell

@property (nonatomic, weak) id<BYBrowerCellDelegate> delegate;

- (void)bindAsset:(BYAsset *)asset;

- (void)setupGesture;
@end
