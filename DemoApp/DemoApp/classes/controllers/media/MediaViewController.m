//
//  MediaViewController.m
//  DemoApp
//
//  Created by qixin on 2018/3/7.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "MediaViewController.h"
#import "PhotoViewController.h"
#import "Contants.h"

@interface MediaViewController ()

@end

@implementation MediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"多媒体";
    
    CGFloat photoOriginY = NAVIGATION_BAR_HEIGHT+20.0;
    CGFloat photoHeight = 30.0;
    UIButton *photoBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, photoOriginY, 100, photoHeight)];
    [photoBtn setTitle:@"photo" forState:(UIControlStateNormal)];
    [photoBtn setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [photoBtn addTarget:self action:@selector(toPhoto) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:photoBtn];
}

-(void)toPhoto{
    [self.navigationController pushViewController:[PhotoViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
