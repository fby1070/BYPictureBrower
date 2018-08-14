//
//  BYBrowerView.h
//  BYPictureBrower
//
//  Created by fuby on 2018/8/8.
//  Copyright © 2018年 StarShare. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BYAsset;

@interface BYBrowerView : UIView


@property (nonatomic, assign) NSInteger index;

- (instancetype)initWithImageViewArray:(NSArray<UIImageView *> *)imageViewArray;
- (instancetype)initWithAssetArray:(NSArray<BYAsset *> *)assetArray;
- (void)show;
- (void)showWithIndex:(NSUInteger)index;
@end
