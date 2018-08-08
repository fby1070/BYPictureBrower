//
//  BYBrowerView.h
//  BYPictureBrower
//
//  Created by fuby on 2018/8/8.
//  Copyright © 2018年 StarShare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYBrowerView : UIView

//@property (nonatomic, strong) UIView *imagesSuperView;
@property (nonatomic, assign) NSInteger index;

- (instancetype)initWithImageArray:(NSArray *)imageArray imagesSuperView:(UIView *)imagesSuperView;
- (void)show;
@end
