//
//  SegmentView.h
//  YipSegment
//
//  Created by Maxye on 16/5/22.
//  Copyright © 2016年 WaitingYip. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^onTouchBtn)(UIButton *btn);

@interface SegmentView : UIView

- (instancetype)initWithSources:(NSArray *)sources
                      andHSpace:(NSInteger)HSpace
                      andMSpace:(NSInteger)MSpace
                  andLineHeight:(NSInteger)lineHeight
                   andLineSpace:(NSInteger)lineSpace;

@property (nonatomic,strong) onTouchBtn touchBtn;

@end
