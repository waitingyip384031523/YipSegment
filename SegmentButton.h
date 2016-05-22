//
//  SegmentButton.h
//  YipSegment
//
//  Created by Maxye on 16/5/21.
//  Copyright © 2016年 WaitingYip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegmentButton : UIButton

+ (instancetype)buttonWithType:(UIButtonType)type
                andSelectImage:(UIImage *)selectImage
               andDefaultImage:(UIImage *)defaultImage
                      andTitle:(NSString *)title
             andTitleTintColor:(UIColor *)tintColor
           andTitleNormalColor:(UIColor *)normalColor
                   andFontSize:(NSInteger)fontSize;

- (void)setEdgeInsetMiddleSpace:(NSInteger)middleSpace;

@end
