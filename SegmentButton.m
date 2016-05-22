//
//  SegmentButton.m
//  YipSegment
//
//  Created by Maxye on 16/5/21.
//  Copyright © 2016年 WaitingYip. All rights reserved.
//

#import "SegmentButton.h"

@implementation SegmentButton

+ (instancetype)buttonWithType:(UIButtonType)type
                andSelectImage:(UIImage *)selectImage
               andDefaultImage:(UIImage *)defaultImage
                      andTitle:(NSString *)title
             andTitleTintColor:(UIColor *)tintColor
           andTitleNormalColor:(UIColor *)normalColor
                   andFontSize:(NSInteger)fontSize
{
    SegmentButton *btn = [self buttonWithType:type];
    [btn setImage:defaultImage forState:UIControlStateNormal];
    [btn setImage:selectImage forState:UIControlStateSelected];
    [btn setImage:selectImage forState:UIControlStateSelected | UIControlStateHighlighted];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
    [btn setTitleColor:normalColor forState:UIControlStateNormal];
    [btn setTitleColor:tintColor forState:UIControlStateSelected];
    [btn setTitleColor:tintColor forState:UIControlStateSelected | UIControlStateHighlighted];
    return btn;
}

- (void)setEdgeInsetMiddleSpace:(NSInteger)middleSpace
{
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -self.imageView.frame.size.width, -self.imageView.frame.size.height-middleSpace/2, 0);
    // button.imageEdgeInsets = UIEdgeInsetsMake(-button.titleLabel.frame.size.height-offset/2, 0, 0, -button.titleLabel.frame.size.width);
    // 由于iOS8中titleLabel的size为0，用上面这样设置有问题，修改一下即可
    self.imageEdgeInsets = UIEdgeInsetsMake(-self.titleLabel.intrinsicContentSize.height-middleSpace/2, 0, 0, -self.titleLabel.intrinsicContentSize.width);
}

@end
