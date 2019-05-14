//
//  BaseViewController.h
//  ScreenRotation
//
//  Created by AoChen on 2019/5/13.
//  Copyright © 2019 ac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
// MARK:- KScreenRotation
/// 默认显示(竖屏显示,横屏隐藏)
@property (nonatomic, assign) BOOL isHiddeStatusBar;
/// 默认锁定状态
@property (assign, nonatomic) BOOL lockScreen;
/// 屏幕方向
@property (assign, nonatomic) UIInterfaceOrientation interOrientation;
// MARK:- KScreenRotation
/**
 改变屏幕方向

 @param orientation 屏幕方向
 */
- (void)rotatScreenTo:(UIInterfaceOrientation)orientation;


@end

NS_ASSUME_NONNULL_END
