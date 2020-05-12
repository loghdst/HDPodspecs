//
//  HDLabel.h
//  Wujie
//
//  Created by guohaidong on 2016/12/1.
//  Copyright © 2016年 Wujieshenghuo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HDLabelLineType)
{
    HDLabelNormalLine = 0,
    HDLabelCenterLine,
    HDLabelBottomLine
};

@interface HDLabel : UILabel

@property (nonatomic, assign) HDLabelLineType lineType;
@property (nonatomic, strong) UIColor *lineColor;

- (void)addPrefixWithText:(NSString *)prefixText textColor:(UIColor *)color textSize:(CGFloat)size isBold:(BOOL)isBold;
- (void)addsuffixWithText:(NSString *)prefixText textColor:(UIColor *)color textSize:(CGFloat)size isBold:(BOOL)isBold;

- (void)setColor:(UIColor *)color formIndex:(NSInteger)location length:(NSInteger)length;
- (void)setSize:(CGFloat)size formIndex:(NSInteger)location length:(NSInteger)length isBold:(BOOL) isBold;

- (void)changeLineSpace:(CGFloat)lineSpace;
- (void)changeWordSpace:(CGFloat)wordSpace;

@end
