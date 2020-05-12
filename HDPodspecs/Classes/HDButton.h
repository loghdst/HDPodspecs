//
//  HDButton.h
//  Wujie
//
//  Created by haidong on 2016/10/27.
//  Copyright © 2016年 haidong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIButtonTitleWithImageAlignment) {
    UIButtonTitleWithImageAlignmentTop = 0,
    UIButtonTitleWithImageAlignmentLeft,
    UIButtonTitleWithImageAlignmentBottom,
    UIButtonTitleWithImageAlignmentRight
};

@interface HDButton : UIButton

/*
 * 位置调整
 */
@property (nonatomic) IBInspectable CGFloat imageTextDistance;

@property (nonatomic, assign) UIButtonTitleWithImageAlignment buttonTitleWithImageAlignment;

- (void)setButtonTitleWithImageAlignment:(UIButtonTitleWithImageAlignment)buttonTitleWithImageAlignment;

/*
 * 设置状态背景
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;
- (UIColor *)backgroundColorForState:(UIControlState)state;


@end
