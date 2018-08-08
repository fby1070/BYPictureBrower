//
//  BYAsset.h
//  BYPictureBrower
//
//  Created by fuby on 2018/8/8.
//  Copyright © 2018年 StarShare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BYAsset : NSObject

/**
 需要放大缩小动画
 */
@property(nonatomic, strong) UIImageView *defaultImageView;

/**
 不需要动画
 */
@property(nonatomic, copy) UIImage *defaultImage;

/**
 图片链接(需要显示比默认图更清楚的图片URL)
 */
@property(nonatomic, copy) NSString *imageUrl;

/**
 图片的宽
 */
@property(nonatomic, assign) CGFloat width;

/**
 图片的高
 */
@property(nonatomic, assign) CGFloat height;

/**
 原图节数
 */
@property(nonatomic, copy) NSString *size;
@end
