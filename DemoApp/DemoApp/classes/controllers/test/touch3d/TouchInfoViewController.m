//
//  TouchInfoViewController.m
//  DemoApp
//
//  Created by qixin on 2018/3/15.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "TouchInfoViewController.h"

@interface TouchInfoViewController ()

@end

@implementation TouchInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"3d touch info";
    
    UILabel *contentShowLabel = [UILabel new];
    contentShowLabel.text = _fromContent;
    contentShowLabel.textColor = [UIColor blueColor];
    contentShowLabel.textAlignment = NSTextAlignmentCenter;
    contentShowLabel.font = [UIFont systemFontOfSize:20.0f];
    [self.view addSubview:contentShowLabel];
    [contentShowLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view.top).mas_offset(100);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(30);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- 实现 previewActionItems delegate ---
-(NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    
    NSMutableArray *actionItems = [NSMutableArray array];
    UIPreviewAction *previewAction1 = [UIPreviewAction actionWithTitle:@"destructive" style:(UIPreviewActionStyleDestructive) handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        NSLog(@"did click destructive");
    }];
    
    [actionItems addObject:previewAction1];
    
    UIPreviewAction *previewAction2 = [UIPreviewAction actionWithTitle:@"default" style:(UIPreviewActionStyleDefault) handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        NSLog(@"did click default");
    }];
    
    [actionItems addObject:previewAction2];
    
    UIPreviewAction *previewAction3 = [UIPreviewAction actionWithTitle:@"selected" style:(UIPreviewActionStyleSelected) handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        NSLog(@"did click selected");
    }];
    
    [actionItems addObject:previewAction3];
    
    return actionItems;
}
#pragma mark --- ---

@end
