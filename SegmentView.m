//
//  SegmentView.m
//  YipSegment
//
//  Created by Maxye on 16/5/22.
//  Copyright © 2016年 WaitingYip. All rights reserved.
//

#import "SegmentView.h"
#import "SegmentButton.h"

@interface SegmentView()

@property (nonatomic) NSInteger right;
@property (nonatomic) UILabel *lineLabel;

@end

@implementation SegmentView

- (instancetype)initWithSources:(NSArray *)sources
                      andHSpace:(NSInteger)HSpace
                      andMSpace:(NSInteger)MSpace
                  andLineHeight:(NSInteger)lineHeight
                   andLineSpace:(NSInteger)lineSpace
{
    if (self == [super init]) {
        [self addSegmentButton:sources andHSpace:HSpace andButtonMiddleSpace:MSpace andLineHeight:lineHeight andLineSpace:lineSpace];
    }
    return self;
}

- (void)addSegmentButton:(NSArray *)sources
               andHSpace:(NSInteger)HSpace
    andButtonMiddleSpace:(NSInteger)middleSpace
           andLineHeight:(NSInteger)lineHeight
            andLineSpace:(NSInteger)lineSpace
{
    [sources enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImage *selectImage = sources[idx][@"selectImage"];
        UIImage *defaultImage = sources[idx][@"defaultImage"];
        NSString *title = sources[idx][@"title"];
        UIColor *tintColor = sources[idx][@"tintColor"];
        UIColor *normalColor = sources[idx][@"normalColor"];
        NSInteger fontSize = [(NSNumber *)sources[idx][@"fontSize"] integerValue];
        SegmentButton *btn = [SegmentButton buttonWithType:UIButtonTypeCustom andSelectImage:selectImage andDefaultImage:defaultImage andTitle:title andTitleTintColor:tintColor andTitleNormalColor:normalColor andFontSize:fontSize];
        CGSize titleSize = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) andTitle:title andFontSize:fontSize];
        CGSize imgSize = defaultImage.size;
        if (titleSize.width > imgSize.width) {
            btn.frame = CGRectMake(_right, 0, titleSize.width, titleSize.height + imgSize.height + middleSpace);
        }else{
            btn.frame = CGRectMake(_right, 0, imgSize.width, titleSize.height + imgSize.height + middleSpace);
        }
        [btn setEdgeInsetMiddleSpace:middleSpace];
        _right += btn.frame.size.width + HSpace;
        btn.tag = idx;
        if (idx == 0) {
            btn.selected = YES;
            _lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(btn.frame.origin.x, btn.frame.size.height + lineSpace, btn.frame.size.width, lineHeight)];
            _lineLabel.backgroundColor = [UIColor redColor];
            [self addSubview:_lineLabel];
        }
        [btn addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }];
}

- (void)touchBtn:(id)sender
{
    UIButton *btn = sender;
    btn.selected = YES;
    [UIView animateWithDuration:0.2 animations:^{
        _lineLabel.center = CGPointMake(btn.center.x, _lineLabel.center.y);
    }];
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *button = obj;
            if (button.tag != btn.tag) {
                button.selected = NO;
            }
        }
    }];
    if (self.touchBtn) {
        self.touchBtn(btn);
    }
}

- (CGSize)boundingRectWithSize:(CGSize)size andTitle:(NSString *)title andFontSize:(NSInteger)fontSize
{
    CGSize titleSize = [title boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
    return titleSize;
}

@end
