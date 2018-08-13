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

- (instancetype)initWithImageView:(UIImageView *)imageView url:(NSString *)url{
  if (self = [super init]) {
    if (imageView) {
      self.defaultImageView = imageView;
      self.normalImage = [[BYPicture alloc] init];
      self.normalImage.image = imageView.image;
      
      self.mediumImage = [[BYPicture alloc] init];
      self.mediumImage.imageUrl = url;
    } else {
      return nil;
    }
  }
  return self;
}

- (instancetype)initWithUrl:(NSString *)imageUrl {
  if (self = [super init]) {
    self.mediumImage = [[BYPicture alloc] init];
    self.mediumImage.imageUrl = imageUrl;
  }
  return self;
}

- (BYPicture *)normalImage {
  if (!_normalImage) {
    _normalImage = [[BYPicture alloc] init];
    _normalImage.image = _defaultImageView.image;
    _normalImage.width = _defaultImageView.image.size.width;
    _normalImage.height = _defaultImageView.image.size.height;
  }
  return _normalImage;
}
@end
