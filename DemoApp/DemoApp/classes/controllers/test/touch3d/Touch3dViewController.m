//
//  Touch3dViewController.m
//  DemoApp
//
//  Created by qixin on 2018/3/15.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "Touch3dViewController.h"
#import "TouchInfoViewController.h"

@interface Touch3dViewController ()

@end

@implementation Touch3dViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"3d touch test";
    
    [self setBtnTouchConnect];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setBtnTouchConnect{
    //注册3D Touch
    //只有在6s及其以上的设备才支持3D Touch,我们可以通过UITraitCollection这个类的UITraitEnvironment协议属性来判断
    /**
     UITraitCollection是UIViewController所遵守的其中一个协议，不仅包含了UI界面环境特征，而且包含了3D Touch的特征描述。
     从iOS9开始，我们可以通过这个类来判断运行程序对应的设备是否支持3D Touch功能。
     UIForceTouchCapabilityUnknown = 0,     //未知
     UIForceTouchCapabilityUnavailable = 1, //不可用
     UIForceTouchCapabilityAvailable = 2    //可用
     */
    if ([self respondsToSelector:@selector(traitCollection)]) {
        if([self.traitCollection respondsToSelector:@selector(forceTouchCapability)]){
            if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
                [self registerForPreviewingWithDelegate:self sourceView:_hasTouchBtn];
            }
        }
    }
}

- (IBAction)hasTouchBtnClick:(id)sender {
    TouchInfoViewController *infoVC = [TouchInfoViewController new];
    infoVC.fromContent = [NSString stringWithFormat:@"btn click %@", _myTextView.text];
    [self.navigationController pushViewController:infoVC animated:YES];
}

#pragma mark --- UIViewControllerPreviewingDelegate ---

-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    
    TouchInfoViewController *infoVC = [TouchInfoViewController new];
    
    infoVC.fromContent = [NSString stringWithFormat:@"3d touch peek %@", _myTextView.text];
    
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    previewingContext.sourceRect = rect;
    
    return infoVC;
}

-(void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    [self showViewController:viewControllerToCommit sender:self];
}

#pragma mark --- ---

@end
