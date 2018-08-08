//
//  BYDemoTableViewCell.h
//  BYPictureBrower
//
//  Created by fuby on 2018/8/8.
//  Copyright © 2018年 StarShare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYDemoTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *label;

- (void) bindArray:(NSArray<NSString *> *)imageArray;
@end
