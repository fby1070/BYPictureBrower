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

//- (void)pictureClick:()
@end

@interface BYBrowerCell : UICollectionViewCell

- (void)bindAsset:(BYAsset *)asset;
@end
