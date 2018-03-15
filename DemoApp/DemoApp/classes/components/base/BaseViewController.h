//
//  BaseViewController.h
//  DemoApp
//
//  Created by qixin on 2018/3/7.
//  Copyright © 2018年 qixin. All rights reserved.
//

// 定义这个常量，就可以不用在开发过程中使用"mas_"前缀。
#define MAS_SHORTHAND
// 定义这个常量，就可以让Masonry帮我们自动把基础数据类型的数据，自动装箱为对象类型。
#define MAS_SHORTHAND_GLOBALS

#import <UIKit/UIKit.h>
#import <Masonry.h>

@interface BaseViewController : UIViewController

@end
