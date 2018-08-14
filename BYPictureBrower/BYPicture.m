//
//  BYPicture.m
//  BYPictureBrower
//
//  Created by fuby on 2018/8/13.
//  Copyright © 2018年 StarShare. All rights reserved.
//

#import "BYPicture.h"
#import <YYKit/YYKit.h>

@implementation BYPicture

- (NSInteger)width {
  if (_width == 0) {
    if (self.image.size.width > kScreenWidth) {
      return kScreenWidth;
    } else {
      return self.image.size.width;
    }
  }
  return _width;
}

- (NSInteger)height {
  if (_height == 0) {
    if (self.image.size.width > kScreenWidth) {
      CGFloat h = (kScreenWidth / self.image.size.width) * self.image.size.height;
      return h;
    } else {
      return self.image.size.height;
    }
  }
  return _height;
}
@end
