//
//  ScrollViewController.m
//  DemoApp
//
//  Created by qixin on 2018/3/12.
//  Copyright © 2018年 qixin. All rights reserved.
//

// 定义这个常量，就可以不用在开发过程中使用"mas_"前缀。
#define MAS_SHORTHAND
// 定义这个常量，就可以让Masonry帮我们自动把基础数据类型的数据，自动装箱为对象类型。
#define MAS_SHORTHAND_GLOBALS

#import "ScrollViewController.h"
#import "Contants.h"
#import <Masonry.h>

@interface ScrollViewController ()

@end

@implementation ScrollViewController
{
    UIScrollView *myScrollView;
    UIView *containerView;
    UIView *redView;
    UIView *blueView;
    UIView *greenView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Scroll view";
    
    [self setViewUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setViewUI{
    myScrollView = [UIScrollView new];
    [self.view addSubview:myScrollView];
//    myScrollView.contentSize = CGSizeMake(1000, 1000);
    myScrollView.backgroundColor = [UIColor grayColor];
    [myScrollView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(NAVIGATION_BAR_HEIGHT+10, 10, 10, 10));
    }];
    
    CGFloat padding = 20.0f;
    containerView = [UIView new];
    containerView.backgroundColor = [UIColor yellowColor];
    [myScrollView addSubview:containerView];
    [containerView makeConstraints:^(MASConstraintMaker *make) {
       make.edges.equalTo(myScrollView).with.insets(UIEdgeInsetsMake(padding, padding, padding, padding));
    }];
    
    greenView = [UIView new];
    greenView.backgroundColor = [UIColor greenColor];
    [containerView addSubview:greenView];
    [greenView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(containerView).offset(padding);
        make.size.mas_equalTo(CGSizeMake(250, 250));
    }];
    
    redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    [containerView addSubview:redView];
    [redView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(containerView).offset(padding);
        make.left.equalTo(greenView.mas_right).offset(padding);
        make.size.equalTo(greenView);
        make.right.equalTo(containerView).offset(-padding);
    }];
    
    blueView = [UIView new];
    blueView.backgroundColor = [UIColor blueColor];
    [containerView addSubview:blueView];
    [blueView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(containerView).offset(padding);
        make.top.equalTo(greenView.mas_bottom).offset(padding);
        make.size.equalTo(greenView);
        make.bottom.equalTo(containerView).offset(-padding);
    }];
    
    
}

@end
