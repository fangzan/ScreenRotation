//
//  TabbarViewController.m
//  ScreenRotation
//
//  Created by AoChen on 2019/5/13.
//  Copyright © 2019 ac. All rights reserved.
//

#import "TabbarViewController.h"
#import "FirstViewController.h"
#import "TwoViewController.h"
@interface TabbarViewController ()

@end

@implementation TabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //功能大厅
    FirstViewController *foundationHallVC = [[FirstViewController alloc] init];
//    foundationHallVC.lockScreen = YES;
    foundationHallVC.title = @"视图一";
    UINavigationController *naviFH = [[UINavigationController alloc] initWithRootViewController:foundationHallVC];
    
    //账号中心
    TwoViewController *userVC = [[TwoViewController alloc] init];
    userVC.title = @"视图一";
    self.viewControllers = @[naviFH, userVC];
}

// MARK:- KScreenRotation
// 是否允许旋转(默认允许)
- (BOOL)shouldAutorotate {
    NSLog(@"%s, line = %d",__FUNCTION__,__LINE__);
    return YES;
}
// MARK:- KScreenRotation
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    NSLog(@"%s, line = %d",__FUNCTION__,__LINE__);
    //允许旋转的方向
    return UIInterfaceOrientationMaskAll;
}

@end
