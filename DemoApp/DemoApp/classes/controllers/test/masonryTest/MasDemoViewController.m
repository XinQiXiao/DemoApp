//
//  MasDemoViewController.m
//  DemoApp
//
//  Created by qixin on 2018/3/9.
//  Copyright © 2018年 qixin. All rights reserved.
//

// 定义这个常量，就可以不用在开发过程中使用"mas_"前缀。
#define MAS_SHORTHAND
// 定义这个常量，就可以让Masonry帮我们自动把基础数据类型的数据，自动装箱为对象类型。
#define MAS_SHORTHAND_GLOBALS

#import "MasDemoViewController.h"
#import <Masonry.h>
#import "Contants.h"

@interface MasDemoViewController ()

@property (nonatomic, strong) UIView *yellowView;
@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIView *grayView;

@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation MasDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Masonry Demo";
    
    // 设置内边距
    // 通过insets简化设置内边距的方式
    _yellowView = [UIView new];
    _yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_yellowView];
    [self setYellowUI];
    
    // 相对于中心
    // 更新约束
//    _greenView = [UIView new];
//    _greenView.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:_greenView];
//    [self setGreenUI];
    
    // 小于等于 大于等于
//    _textLabel = [UILabel new];
//    _textLabel.backgroundColor = [UIColor redColor];
//    _textLabel.text = @"这是测试的字符串。能看到1、2、3个步骤，第一步当然是上传照片了，要上传正面近照哦。上传后，网站会自动识别你的面部，如果觉得识别的不准，你还可以手动修改一下。左边可以看到16项修改参数，最上面是整体修改，你也可以根据自己的意愿单独修改某项，将鼠标放到选项上面，右边的预览图会显示相应的位置。";
//    _textLabel.textColor = [UIColor blackColor];
//    _textLabel.numberOfLines = 0;
//    [self.view addSubview:_textLabel];
//    [self setTextLabelUI];
    
    // 使用基础数据类型当做参数
    // 设置约束优先级
    // 设置约束比例
//    _redView = [UIView new];
//    _redView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:_redView];
//    [self setRedViewUI];
    
    _blueView = [UIView new];
    _blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_blueView];
    //
    _grayView = [UIView new];
    _grayView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_grayView];
    
    // 子视图等高
//    [self setViewEqualHeight];
    // 子视图居中
    [self setViewVerticalCenter];
}

-(void)setYellowUI{
//    [_yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).with.offset(10);
//        make.top.equalTo(self.view).with.offset(NAVIGATION_BAR_HEIGHT+10);
//        make.right.equalTo(self.view).with.offset(-10);
//        make.bottom.equalTo(self.view).with.offset(-10);
//    }];
    [_yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(NAVIGATION_BAR_HEIGHT+10, 10, 10, 10));
    }];
}

-(void)setGreenUI{
    [_greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_yellowView);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    // 为了更清楚的看出约束变化的效果，在显示两秒后更新约束。
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_greenView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
    });
}

-(void)setTextLabelUI{
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_yellowView).with.offset(20);
        make.center.equalTo(_yellowView);
        make.width.lessThanOrEqualTo(@200);
        make.height.greaterThanOrEqualTo(@10);
    }];
}

-(void)setRedViewUI{
    /**
     如果想使用基础数据类型当做参数，Masonry为我们提供了"mas_xx"格式的宏定义。 这些宏定义会将传入的基础数据类型转换为NSNumber类型，这个过程叫做封箱(Auto Boxing)。 "mas_xx"开头的宏定义，内部都是通过MASBoxValue()函数实现的。 这样的宏定义主要有四个，分别是mas_equalTo()、mas_offset()和大于等于、小于等于四个。
    */
//    [_redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(_yellowView);
//        make.width.mas_equalTo(100);
//        make.height.mas_equalTo(100);
//    }];
    /**
     Masonry为我们提供了三个默认的方法，priorityLow()、priorityMedium()、priorityHigh()，这三个方法内部对应着不同的默认优先级。 除了这三个方法，我们也可以自己设置优先级的值，可以通过priority()方法来设置。
     */
//    [_redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(_yellowView);
//        make.width.equalTo(_yellowView).priorityLow();
//        make.width.mas_equalTo(20).priorityHigh();
//        make.height.equalTo(_yellowView).priority(200);
//        make.height.mas_equalTo(100).priority(1000);
//    }];
    // 设置当前约束值乘以多少，例如这个例子是redView的宽度是self.view宽度的0.2倍。
    [_redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_yellowView);
        make.height.mas_equalTo(30);
        make.width.equalTo(_yellowView).multipliedBy(0.2);
    }];
}

-(void)setViewEqualHeight{
    /**
     下面的例子是通过给equalTo()方法传入一个数组，设置数组中子视图及当前make对应的视图之间等高。 需要注意的是，下面block中设置边距的时候，应该用insets来设置，而不是用offset。 因为用offset设置right和bottom的边距时，这两个值应该是负数，所以如果通过offset来统一设置值会有问题。
    */
    
    CGFloat padding = 20.0f;
    [_redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(_yellowView).insets(UIEdgeInsetsMake(padding, padding, 0, padding));
        
        make.bottom.equalTo(_blueView.mas_top).offset(-padding);
        
    }];
    
    [_blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_yellowView).insets(UIEdgeInsetsMake(0, padding, 0, padding));
        make.bottom.equalTo(_grayView.mas_top).offset(-padding);
        
    }];
    
    /**
     下面设置make.height的数组是关键，通过这个数组可以设置这三个视图高度相等。其他例如宽度之类的，也是类似的方式。
    */
        
    [_grayView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(_yellowView).insets(UIEdgeInsetsMake(0, padding, padding, padding));
        make.height.equalTo(@[_redView, _blueView]);
    }];
}

// 垂直居中
-(void)setViewVerticalCenter{
    /**
     要求： 两个视图相对于父视图垂直居中，并且两个视图以及父视图之间的边距均为10，高度为150，两个视图宽度相等。
    */
    CGFloat padding = 10.f;
    [_blueView makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_yellowView);
        make.left.equalTo(_yellowView).mas_offset(padding);
        make.right.equalTo(_grayView.mas_left).mas_offset(-padding);
        make.width.equalTo(_grayView);
        make.height.mas_equalTo(150);
    }];
    [_grayView makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_yellowView);
        make.right.equalTo(_yellowView).mas_offset(-padding);
        make.width.equalTo(_blueView);
        make.height.mas_equalTo(150);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
