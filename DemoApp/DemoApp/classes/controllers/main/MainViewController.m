//
//  MainViewController.m
//  DemoApp
//
//  Created by qixin on 2018/3/7.
//  Copyright © 2018年 qixin. All rights reserved.
//

// 定义这个常量，就可以不用在开发过程中使用"mas_"前缀。
#define MAS_SHORTHAND
// 定义这个常量，就可以让Masonry帮我们自动把基础数据类型的数据，自动装箱为对象类型。
#define MAS_SHORTHAND_GLOBALS

#import "MainViewController.h"
#import "MediaViewController.h"
#import "PhotoViewController.h"
#import "TestViewController.h"
#import "MasDemoViewController.h"
#import "AutoLayoutViewController.h"
#import "MasTableViewViewController.h"
#import "TableViewViewController.h"
#import "Contants.h"
#import <Masonry.h>
#import "ScrollViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"main";
    
    [self setUI];
}

#pragma mark --- createUI ---
-(void)setUI{
    CGFloat btnMargin = 20.0f;
    CGSize btnSize = CGSizeMake(200.0, 30.0);
    UIButton *mediaBtn = [self createBtn:@"多媒体" action:@selector(toMedia)];
    [mediaBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(btnSize);
        make.top.equalTo(self.view).mas_offset(NAVIGATION_BAR_HEIGHT+btnMargin);
    }];
    
    UIButton *testBtn = [self createBtn:@"测试" action:@selector(toTest)];
    [self setBtnConstraints:testBtn topBtn:mediaBtn btnSize:btnSize margin:btnMargin];

    UIButton *masBtn = [self createBtn:@"Masonry 布局" action:@selector(toMas)];
    [self setBtnConstraints:masBtn topBtn:testBtn btnSize:btnSize margin:btnMargin];

    UIButton *autoBtn = [self createBtn:@"Auto layout 布局" action:@selector(toAuto)];
    [self setBtnConstraints:autoBtn topBtn:masBtn btnSize:btnSize margin:btnMargin];

    UIButton *tableBtn = [self createBtn:@"TableView" action:@selector(toTableView)];
    [self setBtnConstraints:tableBtn topBtn:autoBtn btnSize:btnSize margin:btnMargin];

    UIButton *masTableBtn = [self createBtn:@"Masonry TableView" action:@selector(toMasTable)];
    [self setBtnConstraints:masTableBtn topBtn:tableBtn btnSize:btnSize margin:btnMargin];
    
    UIButton *scrollBtn = [self createBtn:@"Masonry Scroll" action:@selector(toScrollView)];
    [self setBtnConstraints:scrollBtn topBtn:masTableBtn btnSize:btnSize margin:btnMargin];
}

-(UIButton *)createBtn:(NSString *)title action:(SEL)action{
    UIButton *btn = [UIButton new];
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [btn addTarget:self action:action forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    return btn;
}

-(void)setBtnConstraints:(UIButton *)currentBtn topBtn:(UIButton *)topButton btnSize:(CGSize)buttonSize margin:(CGFloat)margin{
    [currentBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(buttonSize);
        make.top.equalTo(topButton.mas_bottom).mas_offset(margin);
    }];
}
#pragma mark ------

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

-(void)toTableView{
    [self.navigationController pushViewController:[TableViewViewController new] animated:YES];
}

-(void)toScrollView{
    [self.navigationController pushViewController:[ScrollViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
