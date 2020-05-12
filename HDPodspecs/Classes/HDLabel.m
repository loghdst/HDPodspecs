//
//  HDLabel.m
//
//
//  Created by guohaidong on 2016/12/1.
//  Copyright © 2016年 . All rights reserved.
//

#import "HDLabel.h"

@interface HDLabel ()

@property (nonatomic, strong)NSMutableAttributedString *attributeString;

@end

@implementation HDLabel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    if (self.text) {
        self.attributeString = [[NSMutableAttributedString alloc] initWithString:self.text];
    }
}

- (void)setText:(NSString *)text {
    [super setText:text];
    if (text) {
        self.attributeString = [[NSMutableAttributedString alloc] initWithString:text];
    }
}

- (void)setLineType:(HDLabelLineType)lineType {
    _lineType = lineType;
}

- (void)setLineColor:(UIColor *)lineColor {
    if (lineColor) {
        if (self.lineType == HDLabelCenterLine) {
            [self.attributeString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, self.attributeString.length)];
            [self.attributeString addAttribute:NSStrikethroughColorAttributeName value:lineColor range:NSMakeRange(0, self.attributeString.length)];
            self.attributedText = self.attributeString;
        } else if (self.lineType == HDLabelBottomLine)
        {
            [self.attributeString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, self.attributeString.length)];
            [self.attributeString addAttribute:NSUnderlineColorAttributeName value:lineColor range:NSMakeRange(0, self.attributeString.length)];
            self.attributedText = self.attributeString;
        }
    }
}

- (void)setColor:(UIColor *)color formIndex:(NSInteger)location length:(NSInteger)length
{
    if (self.attributeString) {
        if (location < 0 || location > self.text.length - 1 || location + length > self.text.length) {
            return;
        }
        [self.attributeString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(location, length)];
        self.attributedText = self.attributeString;
    }
}

- (void)setSize:(CGFloat)size formIndex:(NSInteger)location length:(NSInteger)length isBold:(BOOL) isBold
{
    if (self.attributeString) {
        if (location < 0 || location > self.text.length - 1 || location + length > self.text.length) {
            return;
        }
        [self.attributeString addAttribute:NSFontAttributeName value:isBold ? [UIFont boldSystemFontOfSize:size] : [UIFont systemFontOfSize:size] range:NSMakeRange(location, length)];
        self.attributedText = self.attributeString;
    }
}

- (void)addPrefixWithText:(NSString *)prefixText textColor:(UIColor *)color textSize:(CGFloat)size isBold:(BOOL)isBold
{
    if (self.attributeString) {
        if (prefixText == nil) {
            return;
        }
        NSMutableDictionary *attDic = [[NSMutableDictionary alloc] init];
        if (color != nil) {
            [attDic setObject:color forKey:NSForegroundColorAttributeName];
        }
        if (size > 0) {
            [attDic setObject:isBold ? [UIFont boldSystemFontOfSize:size] : [UIFont systemFontOfSize:size] forKey:NSFontAttributeName];
        }
        NSAttributedString *str = [[NSAttributedString alloc] initWithString:prefixText
                                                                  attributes:attDic];
        [self.attributeString insertAttributedString:str atIndex:0];
        self.attributedText = self.attributeString;
    }
}

- (void)addsuffixWithText:(NSString *)prefixText textColor:(UIColor *)color textSize:(CGFloat)size isBold:(BOOL)isBold
{
    if (self.attributeString) {
        if (prefixText == nil) {
            return;
        }
        NSMutableDictionary *attDic = [[NSMutableDictionary alloc] init];
        if (color != nil) {
            [attDic setObject:color forKey:NSForegroundColorAttributeName];
        }
        if (size > 0) {
            [attDic setObject:isBold ? [UIFont boldSystemFontOfSize:size] : [UIFont systemFontOfSize:size] forKey:NSFontAttributeName];
        }
        NSAttributedString *str = [[NSAttributedString alloc] initWithString:prefixText
                                                                  attributes:attDic];
        [self.attributeString appendAttributedString:str];
        self.attributedText = self.attributeString;
    }
}

- (void)changeLineSpace:(CGFloat)lineSpace {
//    NSString *labelText = self.text;
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [self.attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.attributeString length])];
    self.attributedText = self.attributeString;
    [self sizeToFit];
}

- (void)changeWordSpace:(CGFloat)wordSpace {
//    NSString *labelText = self.text;
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    [self.attributeString addAttribute:NSKernAttributeName value:@(wordSpace) range:NSMakeRange(0, [self.attributeString length])];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [self.attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.attributeString length])];
    self.attributedText = self.attributeString;
    [self sizeToFit];
}


@end
