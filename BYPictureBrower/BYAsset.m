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

- (NSInteger)width {
  if (_width == 0) {
    _width = kScreenWidth;
  }
  return _width;
}

- (NSInteger)height {
  if (_height == 0) {
    if (_defaultImage) {
      _height = (kScreenWidth / _defaultImage.size.width) * _defaultImage.size.height;
    }
  }
  return _height;
}
@end
