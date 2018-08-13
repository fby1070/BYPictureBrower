//
//  BYAsset.h
//  BYPictureBrower
//
//  Created by fuby on 2018/8/8.
//  Copyright © 2018年 StarShare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BYPicture.h"

@interface BYAsset : NSObject

/**
 需要放大缩小动画
 */
@property(nonatomic, strong) UIImageView *defaultImageView;

/**
 * 小图(placeHolder)
 */
@property(nonatomic, strong) BYPicture *smallImage;

/**
 * 中图(用于显示)
 */
@property(nonatomic, strong) BYPicture *mediumImage;

/**
 * 大图（原图下载）
 */
@property(nonatomic, strong) BYPicture *largeImage;
@end
