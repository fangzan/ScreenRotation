//
//  BaseViewController.m
//  ScreenRotation
//
//  Created by AoChen on 2019/5/13.
//  Copyright © 2019 ac. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
// MARK:- KScreenRotation
/// 屏幕锁定方向 默认(UIInterfaceOrientationPortrait)
@property (assign, nonatomic) UIInterfaceOrientation lockOrientation;

@end

@implementation BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
    //监听设备旋转 改变 视图 对应位置
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange) name:UIDeviceOrientationDidChangeNotification object:nil];
    // 默认锁定屏幕
    _lockScreen = YES;
    // 默认屏幕方向
    _lockOrientation = UIInterfaceOrientationPortrait;
    // 默认显示状态栏
    _isHiddeStatusBar = NO;
    
}

- (void)setLockScreen:(BOOL)lockScreen
{
    if (lockScreen) {
        // 获取当前屏幕方向
        [self deviceOrientationDidChange];
        
        _lockOrientation = _interOrientation;
        
        _lockScreen = lockScreen;
    } else {
        _lockScreen = lockScreen;
        // 获取当前屏幕方向
        [self deviceOrientationDidChange];
        // 旋转屏幕
        [self rotatScreenTo:_interOrientation];
    }
}

/**
 监听的屏幕旋转
 用来控制横竖屏时调整视图位置
 */
- (void)deviceOrientationDidChange
{
    if (_lockScreen) {
        // 锁定情况
        _interOrientation = _lockOrientation;
    } else {
        [self getCurrenrInterfaceOrientation];
    }
    NSLog(@"屏幕旋转->%ld",_interOrientation);
    // 可实现屏幕旋转回调

}

/**
 设置屏幕方向
 
 @param orientation 屏幕方向
 */
- (void)rotatScreenTo:(UIInterfaceOrientation)orientation
{
    if (_lockScreen) {
        [self setScreenRotat:_lockOrientation];
    } else {
        [self setScreenRotat:orientation];
    }
}

- (void)setScreenRotat:(UIInterfaceOrientation)orientation
{
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector             = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val                  = orientation;
        // 从2开始是因为0 1 两个参数已经被selector和target占用
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}


- (void)getCurrenrInterfaceOrientation
{
    UIDeviceOrientation deviceO = [[UIDevice currentDevice] orientation];
    
    switch (deviceO) {
        case UIDeviceOrientationPortrait:
            _interOrientation = UIInterfaceOrientationPortrait;
            break;
        case UIDeviceOrientationLandscapeLeft:
            _interOrientation = UIInterfaceOrientationLandscapeRight;
            break;
        case UIDeviceOrientationLandscapeRight:
            _interOrientation = UIInterfaceOrientationLandscapeLeft;
            break;
        case UIDeviceOrientationUnknown:
            _interOrientation = UIInterfaceOrientationUnknown;
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            _interOrientation = UIInterfaceOrientationPortraitUpsideDown;
            break;
        default:
            break;
    }
}

/**
 此方法来控制能否横竖屏 控制锁屏

 @return 当前视图支持的屏幕方向
 */
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    UIInterfaceOrientationMask inter;
    if (_lockScreen) {
        switch (_lockOrientation) {
            case 1:
                inter = UIInterfaceOrientationMaskPortrait;
                break;
            case 2:
                inter = UIInterfaceOrientationMaskPortraitUpsideDown;
                break;
            case 3:
                inter = UIInterfaceOrientationMaskLandscapeRight;
                break;
            case 4:
                inter = UIInterfaceOrientationMaskLandscapeLeft;
                break;
            default:
                inter = UIInterfaceOrientationMaskAll;
                break;
        }
    } else {
        inter = UIInterfaceOrientationMaskAll;
    }
    //支持全部方向
    return inter;
}

// MARK:- 状态栏控制
- (void)setIsHiddeStatusBar:(BOOL)isHiddeStatusBar{
    _isHiddeStatusBar = isHiddeStatusBar;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (BOOL)prefersStatusBarHidden {
    return self.isHiddeStatusBar;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
