//
//  BYBrowerCell.m
//  BYPictureBrower
//
//  Created by fuby on 2018/8/8.
//  Copyright © 2018年 StarShare. All rights reserved.
//

#import "BYBrowerCell.h"
#import <YYKit/YYKit.h>

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

- (void)bindImage:(UIImage *)image {
  CGFloat h = (self.bounds.size.width / image.size.width) * image.size.height;
  CGFloat y = (self.frame.size.height - h) / 2;
  self.pictureView.frame = CGRectMake(0, y, self.bounds.size.width, h);
//  self.pictureView setImageURL:<#(NSURL * _Nullable)#>
  
}
@end
