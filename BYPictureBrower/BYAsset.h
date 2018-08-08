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

@property(nonatomic, copy) UIImage *placeHolderImage;

/**
 * 图片链接
 */
@property(nonatomic, copy) NSString *imageUrl;

/**
 * 图片的宽
 */
@property(nonatomic, assign) NSInteger width;

/**
 * 图片的高
 */
@property(nonatomic, assign) NSInteger height;

/**
 * 原图节数
 */
@property(nonatomic, copy) NSString *size;
@end
