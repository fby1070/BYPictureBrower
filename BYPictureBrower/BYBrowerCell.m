//
//  BYBrowerCell.m
//  BYPictureBrower
//
//  Created by fuby on 2018/8/8.
//  Copyright © 2018年 StarShare. All rights reserved.
//

#import "BYBrowerCell.h"
#import <YYKit/YYKit.h>
#import "BYAsset.h"

@interface BYBrowerCell ()

@property (nonatomic, strong) UIImageView *pictureView;
@end

@implementation BYBrowerCell

- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    [self initSubviews];
  }
  return self;
}

- (void)initSubviews {
  self.pictureView = [[UIImageView alloc] init];
  [self addSubview:self.pictureView];
}

- (void)bindAsset:(BYAsset *)asset {
  CGFloat y = (self.bounds.size.height - asset.height) / 2;
  self.pictureView.frame = CGRectMake(0, y, asset.width, asset.height);
  [self.pictureView setImageWithURL:[NSURL URLWithString:asset.imageUrl] placeholder:[UIImage imageWithColor:[UIColor redColor]]];
}
@end
