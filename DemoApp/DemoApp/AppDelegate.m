//
//  AppDelegate.m
//  DemoApp
//
//  Created by qixin on 2018/3/7.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[MainViewController new]];

    self.window.rootViewController = nav;
    
    // set shortCutItems
    [self setShortCutItems];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(nonnull UIApplicationShortcutItem *)shortcutItem completionHandler:(nonnull void (^)(BOOL))completionHandler{
    NSLog(@"shortcutItem type = %@", shortcutItem.type);
    NSLog(@"shortcutItem userInfo = %@", shortcutItem.userInfo);
}


#pragma mark --- HOME SCRREN  Quick Actions ---
-(void )setShortCutItems{
    NSMutableArray *shortCutItems = (NSMutableArray *)[UIApplication sharedApplication].shortcutItems;
    
    UIApplicationShortcutItem *shoreItem1 = [[UIApplicationShortcutItem alloc] initWithType:@"cn.qixin.DemoApp.openSearch" localizedTitle:@"搜索" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch] userInfo:nil];
    [shortCutItems addObject:shoreItem1];
    
    UIApplicationShortcutItem *shoreItem2 = [[UIApplicationShortcutItem alloc] initWithType:@"cn.qixin.DemoApp.openCompose" localizedTitle:@"新消息" localizedSubtitle:@"哈哈哈" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCompose] userInfo:nil];
    [shortCutItems addObject:shoreItem2];
    
    NSDictionary *locUserInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"120.00", @"lon", nil];
//    NSDictionary *locUserInfo = @{@"loc_lon": @"160.000"};
    // TODO 
    UIApplicationShortcutItem *shoreItem3 = [[UIApplicationShortcutItem alloc] initWithType:@"cn.qixin.DemoApp.openLocation" localizedTitle:@"位置" localizedSubtitle:@"定位中" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLocation] userInfo:locUserInfo];
    [shortCutItems addObject:shoreItem3];
    
    UIApplicationShortcutItem *shoreItem4 = [[UIApplicationShortcutItem alloc] initWithType:@"cn.qixin.DemoApp.openAdd" localizedTitle:@"添加" localizedSubtitle:@"ceshi" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd] userInfo:nil];
    [shortCutItems addObject:shoreItem4];
    
    [UIApplication sharedApplication].shortcutItems = shortCutItems;
}
#pragma mark --- ---
@end
