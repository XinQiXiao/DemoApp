//
//  MasTableViewViewController.m
//  DemoApp
//
//  Created by qixin on 2018/3/9.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "MasTableViewViewController.h"
#import "Contants.h"
#import <Masonry.h>
#import "MasTableViewCell.h"

static NSString *iden = @"custom_cell";

@interface MasTableViewViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation MasTableViewViewController
{
    // UI
    UITableView *myTableView;
    
    // Data
    NSArray *dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Masonry TableView";
    
    dataArr = @[@"自定义了一个UIImageView和UILabel控件，并且通过Masonry进行约束", @"测试的目的是啊啊啊啊", @"所以在这里将这个答案翻译了一下，希望对大家有所帮助。以下是答案的全文翻译…… constraints)没有被你添加的更高优先级的约束覆盖，以使得这些子视图的固有内容尺寸(intrinsic content size)来推动contentView的高度。"];
    
    myTableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 设置tableView自动高度
    myTableView.rowHeight = UITableViewAutomaticDimension;
    [myTableView registerClass:[MasTableViewCell class] forCellReuseIdentifier:iden];
    [self.view addSubview:myTableView];
    [myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(NAVIGATION_BAR_HEIGHT, 0, 0, 0));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark --- ---
#pragma mark --- UITableViewDataSource ---
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(dataArr.count){
        return dataArr.count;
    }
    return 1;
}
-(MasTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MasTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if(cell == nil){
        cell = [[MasTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:iden];
    }
    cell.detail = [dataArr objectAtIndex:indexPath.row];
    return cell;
}
#pragma mark --- ---

#pragma mark --- ---
#pragma mark --- UITableViewDelegate ---
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0f;
}
#pragma mark --- ---

@end
