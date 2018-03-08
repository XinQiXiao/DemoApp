//
//  PhotoViewController.m
//  DemoApp
//
//  Created by qixin on 2018/3/7.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "PhotoViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "Contants.h"

@interface PhotoViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIImagePickerController *imagePickerController;

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"pick";
    
    CGFloat pickOriginY = NAVIGATION_BAR_HEIGHT+20.0;
    CGFloat pickHeight = 30.0;
    UIButton *pickBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, pickOriginY, 100, pickHeight)];
    [pickBtn setTitle:@"采集图片" forState:(UIControlStateNormal)];
    [pickBtn setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [pickBtn setTitleColor:[UIColor redColor] forState:(UIControlStateHighlighted)];
    [pickBtn addTarget:self action:@selector(pickPhoto) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:pickBtn];
    
    CGFloat imagaOriginY = pickOriginY+pickHeight+20.0;
    CGFloat imageHeight = 300.0;
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, imagaOriginY, DEVICE_WIDTH-20, imageHeight)];
    _imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_imageView];
}

// 懒加载
-(UIImagePickerController *)imagePickerController{
    if(!_imagePickerController){
        _imagePickerController = [UIImagePickerController new];
        
        // 采集源类型
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        // 媒体类型
        _imagePickerController.mediaTypes = [NSArray arrayWithObject:(__bridge NSString*)kUTTypeImage];
        // 设置代理
        _imagePickerController.delegate = self;
    }
    return _imagePickerController;
}

-(void)pickPhoto{
    // 通过摄像头来采集
    if([UIImagePickerController isSourceTypeAvailable:(UIImagePickerControllerSourceTypeCamera)]){
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    // 通过图片库来采集
    else {
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- ---
#pragma mark --- UIImagePickerControllerDelegate ---
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    // 获取媒体类型
    NSString *type = info[UIImagePickerControllerMediaType];
    // 如果是图片类型
    if([type isEqualToString:(__bridge NSString*)kUTTypeImage]){
        // 获取采集到的图片
        UIImage *img = info[UIImagePickerControllerOriginalImage];
        // 显示
        _imageView.image = img;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark --- ---

@end
