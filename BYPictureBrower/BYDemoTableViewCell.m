//
//  BYDemoTableViewCell.m
//  BYPictureBrower
//
//  Created by fuby on 2018/8/8.
//  Copyright © 2018年 StarShare. All rights reserved.
//

#import "BYDemoTableViewCell.h"
#import "UIButton+YYWebImage.h"
#import "UIColor+YYAdd.h"
#import "UIImage+YYAdd.h"
#import <YYKit/YYKit.h>
#import "BYBrowerView.h"

@interface BYDemoTableViewCell()

@property (nonatomic, strong) UIImageView *photoView;
@property (nonatomic, strong) NSArray *imageArray;
@end

@implementation BYDemoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    [self initSubviews];
  }
  return self;
}

- (void)initSubviews {
  self.photoView = [[UIImageView alloc] init];
  self.photoView.userInteractionEnabled = YES;
  self.photoView.frame = CGRectMake(100, 10, 60, 60);
  [self.photoView setImageWithURL:[NSURL URLWithString:@"http://ww2.sinaimg.cn/thumbnail/904c2a35jw1emu3ec7kf8j20c10epjsn.jpg"] options:YYWebImageOptionSetImageWithFadeAnimation];
  [self.contentView addSubview:self.photoView];
  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTapChange:)];
  [self.photoView addGestureRecognizer:tap];
  
  self.label = [[UILabel alloc] init];
  self.label.frame = CGRectMake(80, 40, 60, 15);
  [self.contentView addSubview:self.label];
}

- (void) bindArray:(NSArray<NSString *> *)imageArray {
  self.imageArray = imageArray;
  NSMutableArray *imageViewArray = [NSMutableArray arrayWithCapacity:imageArray.count];
  [imageArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(10 + idx * 70, 10, 60, 60);
    imageView.userInteractionEnabled = YES;
    [imageView setImageWithURL:imageViewArray[idx] options:YYWebImageOptionSetImageWithFadeAnimation];
    [imageViewArray addObject:imageView];
    [self addSubview:imageView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTapChange:)];
    [imageView addGestureRecognizer:tap];
  }];
}

- (void)doTapChange:(UITapGestureRecognizer *)tapGestureRecognizer {
  BYBrowerView *view = [[BYBrowerView alloc] initWithImageArray:self.imageArray];
  view.imagesSuperView = self;
  [view show];
}
@end
