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
#import "MasDemoViewController.h"
#import "AutoLayoutViewController.h"
#import "MasTableViewViewController.h"
#import "Contants.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"main";
    
    CGFloat mediaOriginY = NAVIGATION_BAR_HEIGHT+20.0;
    CGFloat btnHeight = 30.0;
    CGFloat btnWidth = 200.0;
    UIButton *mediaBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, mediaOriginY, btnWidth, btnHeight)];
    [mediaBtn setTitle:@"多媒体" forState:(UIControlStateNormal)];
    [mediaBtn setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [mediaBtn addTarget:self action:@selector(toMedia) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:mediaBtn];
    
    CGFloat testOriginY = mediaOriginY+btnHeight+20.0;
    UIButton *testBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, testOriginY, btnWidth, btnHeight)];
    [testBtn setTitle:@"测试" forState:(UIControlStateNormal)];
    [testBtn setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [testBtn addTarget:self action:@selector(toTest) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:testBtn];
    
    CGFloat masOriginY = testOriginY+btnHeight+20.0;
    UIButton *masBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, masOriginY, btnWidth, btnHeight)];
    [masBtn setTitle:@"Masonry 布局" forState:(UIControlStateNormal)];
    [masBtn setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [masBtn addTarget:self action:@selector(toMas) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:masBtn];
    
    CGFloat autoOriginY = masOriginY+btnHeight+20.0;
    UIButton *autoBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, autoOriginY, btnWidth, btnHeight)];
    [autoBtn setTitle:@"Auto layout 布局" forState:(UIControlStateNormal)];
    [autoBtn setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [autoBtn addTarget:self action:@selector(toAuto) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:autoBtn];
    
    CGFloat masTableOriginY = autoOriginY+btnHeight+20.0;
    UIButton *masTableBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, masTableOriginY, btnWidth, btnHeight)];
    [masTableBtn setTitle:@"Masonry TableView" forState:(UIControlStateNormal)];
    [masTableBtn setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [masTableBtn addTarget:self action:@selector(toMasTable) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:masTableBtn];
}

-(void)toMedia{
    [self.navigationController pushViewController:[PhotoViewController new] animated:YES];
}

-(void)toTest{
    [self.navigationController pushViewController:[TestViewController new] animated:YES];
}

-(void)toMas{
    [self.navigationController pushViewController:[MasDemoViewController new] animated:YES];
}

-(void)toAuto{
    [self.navigationController pushViewController:[AutoLayoutViewController new] animated:YES];
}

-(void)toMasTable{
   [self.navigationController pushViewController:[MasTableViewViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
