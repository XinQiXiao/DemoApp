//
//  TableViewViewController.m
//  DemoApp
//
//  Created by qixin on 2018/3/12.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "TableViewViewController.h"
#import "Contants.h"

@interface TableViewViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation TableViewViewController
{
    // UI
    UITableView *myTableView;
    
    // Data
    NSArray *dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Table View";
    
    dataArr = @[@"zhangsan", @"lisi", @"wangwu"];
    
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT+10, DEVICE_WIDTH, DEVICE_HEIGHT-NAVIGATION_BAR_HEIGHT-20) style:(UITableViewStylePlain)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    myTableView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:myTableView];
    
}

#pragma mark --- ---
#pragma mark --- UITableViewDataSource ---

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(dataArr.count > 0){
        return dataArr.count;
    }
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    if(dataArr.count > 0){
//        return dataArr.count;
//    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *iden = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    UILabel *nameLabel = [UILabel new];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:iden];
        
//        cell.backgroundColor = [UIColor redColor];
    }
    nameLabel.frame = CGRectMake(50, 20, 100, 40);
    nameLabel.textColor = [UIColor blueColor];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.font = [UIFont systemFontOfSize:20.0f];
    [cell addSubview:nameLabel];
    
    NSString *name = [dataArr objectAtIndex:indexPath.row];
    nameLabel.text = name;
    
    return cell;
}

#pragma mark --- ---

#pragma mark --- ---
#pragma mark --- UITableViewDelegate ---

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0f;
}

#pragma mark ---  ---

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
