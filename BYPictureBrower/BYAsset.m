//
//  BYAsset.m
//  BYPictureBrower
//
//  Created by fuby on 2018/8/8.
//  Copyright © 2018年 StarShare. All rights reserved.
//

#import "BYAsset.h"
#import <YYKit/YYKit.h>

@implementation BYAsset

//- (UIImage *)defaultImage {
//  if (!_defaultImage) {
//    if (_defaultImageView) {
//      _defaultImage = _defaultImageView.image;
//    }
//  }
//  return _defaultImage;
//}
//
//- (CGFloat)width {
//  if (_width == 0) {
//    _width = kScreenWidth;
//  }
//  return _width;
//}
//
//- (CGFloat)height {
//  if (_height == 0) {
//    if (_defaultImage) {
//      _height = (kScreenWidth / _defaultImage.size.width) * _defaultImage.size.height;
//    } else if (_defaultImageView) {
//      _height = (kScreenWidth / _defaultImageView.image.size.width) * _defaultImageView.image.size.height;
//    }
//  }
//  return _height;
//}

- (BYPicture *)smallImage {
  if (!_smallImage) {
    _smallImage = [[BYPicture alloc] init];
    _smallImage.image = _defaultImageView.image;
    _smallImage.width = _defaultImageView.image.size.width;
    _smallImage.height = _defaultImageView.image.size.height;
  }
  return _smallImage;
}
@end
