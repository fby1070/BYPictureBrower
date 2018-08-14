//
//  BYDemoTableViewCell.m
//  BYPictureBrower
//
//  Created by fuby on 2018/8/8.
//  Copyright © 2018年 StarShare. All rights reserved.
//

#import "BYDemoTableViewCell.h"
#import <YYKit/YYKit.h>
#import "BYBrowerView.h"
#import "BYAsset.h"

@interface BYDemoTableViewCell()

@property (nonatomic, strong) UIImageView *photoView;
@property (nonatomic, strong) NSArray<NSString *> *imageUrlArray;
@property (nonatomic, strong) NSArray<UIImageView *> *imageViewArray;
@end

@implementation BYDemoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    [self initSubviews];
  }
  return self;
}

- (void)initSubviews {
//  self.photoView = [[UIImageView alloc] init];
//  self.photoView.userInteractionEnabled = YES;
//  self.photoView.frame = CGRectMake(100, 10, 60, 60);
//  [self.photoView setImageWithURL:[NSURL URLWithString:@"http://ww2.sinaimg.cn/thumbnail/904c2a35jw1emu3ec7kf8j20c10epjsn.jpg"] options:YYWebImageOptionSetImageWithFadeAnimation];
//  [self.contentView addSubview:self.photoView];
//  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTapChange:)];
//  [self.photoView addGestureRecognizer:tap];
//  
//  self.label = [[UILabel alloc] init];
//  self.label.frame = CGRectMake(80, 40, 60, 15);
//  [self.contentView addSubview:self.label];
}

- (void) bindArray:(NSArray<NSString *> *)imageArray {
  self.imageUrlArray = imageArray;
  NSMutableArray *imageViewArray = [NSMutableArray arrayWithCapacity:imageArray.count];
  [imageArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    UIImageView *imageView = [[UIImageView alloc] init];
    CGFloat x = 10 + idx * 70;
    CGFloat y = 10;
    if (x > kScreenWidth) {
      x = x - kScreenWidth;
      
      y += 70;
    }
    imageView.frame = CGRectMake(x, y, 60, 60);
    imageView.userInteractionEnabled = YES;
    [imageView setImageWithURL:[NSURL URLWithString:obj] options:YYWebImageOptionSetImageWithFadeAnimation];
    [imageViewArray addObject:imageView];
    [self addSubview:imageView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTapChange:)];
    [imageView addGestureRecognizer:tap];
  }];
  self.imageViewArray = [imageViewArray copy];
}

- (void)doTapChange:(UITapGestureRecognizer *)tapGestureRecognizer {
  
  NSMutableArray *assetArray = [NSMutableArray arrayWithCapacity:self.imageViewArray.count];
  [self.imageViewArray enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    BYAsset *asset = [[BYAsset alloc] init];
    asset.defaultImageView = obj;//空间中处理
    [assetArray addObject:asset];
  }];
  
  NSArray *highArray = @[@"http://ww2.sinaimg.cn/bmiddle/904c2a35jw1emu3ec7kf8j20c10epjsn.jpg",
                         @"http://ww2.sinaimg.cn/bmiddle/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                         @"http://ww2.sinaimg.cn/bmiddle/67307b53jw1epqq3bmwr6j20c80axmy5.jpg",
                         @"http://ww2.sinaimg.cn/bmiddle/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg",
                         @"http://ww2.sinaimg.cn/bmiddle/642beb18gw1ep3629gfm0g206o050b2a.gif",
                         @"http://ww1.sinaimg.cn/bmiddle/9be2329dgw1etlyb1yu49j20c82p6qc1.jpg"
                         ];
  
  [highArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    BYAsset *asset = assetArray[idx];
    BYPicture *pic = [[BYPicture alloc] init];
    pic.imageUrl = obj;
    asset.mediumImage = pic;
    
  }];
  
//  BYBrowerView *view = [[BYBrowerView alloc] initWithAssetArray:[assetArray copy]];


  BYBrowerView *view = [[BYBrowerView alloc] initWithImageViewArray:self.imageViewArray];
  
//  [view show];
  [view showWithIndex:0];
}
@end
