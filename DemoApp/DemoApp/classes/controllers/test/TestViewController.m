//
//  TestViewController.m
//  DemoApp
//
//  Created by qixin on 2018/3/8.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "TestViewController.h"


@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Test";
    NSLayoutConstraint *a =[NSLayoutConstraint new];
    NSString *str = @"aaa";
    NSString *copyStr = [str copy];
    NSLog(@"str = %@ copyStr= %@",str,copyStr);
    NSLog(@"str = %p copyStr= %p",str,copyStr);
    NSLog(@"指针地址：str = %p copyStr= %p",&str,&copyStr);
    copyStr = @"bbb";
    NSLog(@"after str = %@ copyStr= %@",str,copyStr);
    NSLog(@"after str = %p copyStr= %p",str,copyStr);
    NSLog(@"after 指针地址：str = %p copyStr= %p",&str,&copyStr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
