//
//  ViewController.m
//  YipSegment
//
//  Created by Maxye on 16/5/21.
//  Copyright © 2016年 WaitingYip. All rights reserved.
//

#import "ViewController.h"
#import "SegmentView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *sources = @[@{@"title":@"相机", @"selectImage":[UIImage imageNamed:@"cameraH"], @"defaultImage":[UIImage imageNamed:@"cameraN"], @"tintColor":[UIColor redColor], @"normalColor":[UIColor blackColor], @"fontSize":[NSNumber numberWithInteger:14]},@{@"title":@"通讯录", @"selectImage":[UIImage imageNamed:@"cameraH"], @"defaultImage":[UIImage imageNamed:@"cameraN"], @"tintColor":[UIColor redColor], @"normalColor":[UIColor blackColor], @"fontSize":[NSNumber numberWithInteger:14]},@{@"title":@"常用", @"selectImage":[UIImage imageNamed:@"cameraH"], @"defaultImage":[UIImage imageNamed:@"cameraN"], @"tintColor":[UIColor redColor], @"normalColor":[UIColor blackColor], @"fontSize":[NSNumber numberWithInteger:14]},@{@"title":@"常用", @"selectImage":[UIImage imageNamed:@"cameraH"], @"defaultImage":[UIImage imageNamed:@"cameraN"], @"tintColor":[UIColor redColor], @"normalColor":[UIColor blackColor], @"fontSize":[NSNumber numberWithInteger:14]}];
    SegmentView *segView = [[SegmentView alloc] initWithSources:sources andHSpace:10 andMSpace:10 andLineHeight:1 andLineSpace:10];
    segView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 200);
    segView.touchBtn = ^(UIButton *btn){
        
    };
    [self.view addSubview:segView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
