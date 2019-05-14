//
//  AppDelegate.m
//  ScreenRotation
//
//  Created by AoChen on 2019/5/13.
//  Copyright © 2019 ac. All rights reserved.
//

#import "AppDelegate.h"
#import "TabbarViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    TabbarViewController *tabbarVC = [[TabbarViewController alloc] init];
    [self.window setRootViewController:tabbarVC];
    return YES;
}

// MARK:- KScreenRotation
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    NSUInteger orientations = UIInterfaceOrientationMaskAllButUpsideDown;
    if(self.window.rootViewController){
        //取出当前显示的控制器
        UIViewController *presentedViewController = [self topViewControllerWithRootViewController:self.window.rootViewController];
        //按当前控制器支持的方向确定旋转方向(将旋转方向重新交给每个控制器自己控制)
        orientations = [presentedViewController supportedInterfaceOrientations];
    }
    return orientations;
}

// MARK:- KScreenRotation
//一层一层的进行查找判断
- (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController
{
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* nav = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:nav.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}


@end
