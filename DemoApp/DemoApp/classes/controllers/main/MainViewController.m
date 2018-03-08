//
//  MainViewController.m
//  DemoApp
//
//  Created by qixin on 2018/3/7.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "MainViewController.h"
#import "MediaViewController.h"
#import "PhotoViewController.h"
#import "TestViewController.h"
#import "Contants.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"main";
    
    CGFloat mediaOriginY = NAVIGATION_BAR_HEIGHT+20.0;
    CGFloat mediaHeight = 30.0;
    UIButton *mediaBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, mediaOriginY, 100, mediaHeight)];
    [mediaBtn setTitle:@"多媒体" forState:(UIControlStateNormal)];
    [mediaBtn setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [mediaBtn addTarget:self action:@selector(toMedia) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:mediaBtn];
    
    CGFloat testOriginY = mediaOriginY+mediaHeight+20.0;
    CGFloat testHeight = 30.0;
    UIButton *testBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, testOriginY, 100, testHeight)];
    [testBtn setTitle:@"测试" forState:(UIControlStateNormal)];
    [testBtn setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [testBtn addTarget:self action:@selector(toTest) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:testBtn];
}

-(void)toMedia{
    [self.navigationController pushViewController:[PhotoViewController new] animated:YES];
}

-(void)toTest{
    [self.navigationController pushViewController:[TestViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
