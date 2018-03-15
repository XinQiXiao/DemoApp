//
//  Touch3dViewController.h
//  DemoApp
//
//  Created by qixin on 2018/3/15.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "BaseViewController.h"

@interface Touch3dViewController : BaseViewController<UIViewControllerPreviewingDelegate>

@property (weak, nonatomic) IBOutlet UITextView *myTextView;
@property (weak, nonatomic) IBOutlet UIButton *hasTouchBtn;

- (IBAction)hasTouchBtnClick:(id)sender;

@end
