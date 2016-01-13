//
//  ViewController.m
//  DDPrepareJieMian
//
//  Created by MAC OS X on 15/11/27.
//  Copyright © 2015年 anfle. All rights reserved.
//

#import "ViewController.h"
#import "DDBMKHouse.h"
#import "DDFindHouse.h"
#import "DDGroundHouse.h"
#import "DDSetHouse.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DDFindHouse* fvc = [[DDFindHouse alloc]init];
    fvc.tabBarItem.title = @"推荐";
    fvc.tabBarItem.image = [UIImage imageNamed:@"file.png"];
    UINavigationController* FNV = [[UINavigationController alloc]initWithRootViewController:fvc];
    
    DDGroundHouse* gvc = [[DDGroundHouse alloc]init];
    gvc.tabBarItem.title = @"搜索";
    gvc.tabBarItem.image = [UIImage imageNamed:@"main.png"];
    UINavigationController* GNV = [[UINavigationController alloc]initWithRootViewController:gvc];
    
    DDBMKHouse* bvc = [[DDBMKHouse alloc]init];
    bvc.tabBarItem.title = @"问答社区";
    bvc.tabBarItem.image = [UIImage imageNamed:@"news.png"];
    UINavigationController* BNV = [[UINavigationController alloc]initWithRootViewController:bvc];
    
    DDSetHouse* svc = [[DDSetHouse alloc]init];
    svc.tabBarItem.title = @"个人";
    svc.tabBarItem.image = [UIImage imageNamed:@"person.png"];
    UINavigationController* SNV = [[UINavigationController alloc]initWithRootViewController:svc];
    
    UITabBarController* controller = [[UITabBarController alloc]init];
    controller.viewControllers = @[FNV,GNV,BNV,SNV];
    UIWindow* window = [UIApplication sharedApplication].delegate.window;
    window.rootViewController = controller;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
