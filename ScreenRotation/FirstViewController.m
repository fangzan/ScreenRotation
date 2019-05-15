//
//  FirstViewController.m
//  ScreenRotation
//
//  Created by AoChen on 2019/5/13.
//  Copyright © 2019 ac. All rights reserved.
//

#import "FirstViewController.h"
#import "ViewController.h"
@interface FirstViewController ()

@property (nonatomic, strong) UIButton *verticallyBtn;// 竖屏
@property (nonatomic, strong) UIButton *horizontallyBtn;// 横屏
@property (nonatomic, strong) UIButton *lockBtn;

@property (nonatomic, strong) UIButton *pushBtn;

@property (nonatomic, strong) UITextField *tf;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.pushBtn.backgroundColor = [UIColor redColor];
    [self.pushBtn setTitle:@"Push" forState:UIControlStateNormal];
    [self.pushBtn addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.pushBtn];
    
    
    self.verticallyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.verticallyBtn.backgroundColor = [UIColor redColor];
    [self.verticallyBtn setTitle:@"竖屏" forState:UIControlStateNormal];
    [self.verticallyBtn addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.verticallyBtn];
    self.horizontallyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.horizontallyBtn.backgroundColor = [UIColor redColor];
    [self.horizontallyBtn setTitle:@"横屏" forState:UIControlStateNormal];
    [self.horizontallyBtn addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.horizontallyBtn];
    
    self.lockBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.lockBtn setTitle:self.lockScreen?@"屏幕锁定状态":@"屏幕解锁状态" forState:UIControlStateNormal];
    [self.lockBtn addTarget:self action:@selector(didClickLock:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.lockBtn];

    
    self.tf = [[UITextField alloc] init];
    self.tf.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.tf];
    
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    NSLog(@"34");
    
    CGFloat K_MArgin = 15;
    
    self.pushBtn.frame = CGRectMake(K_MArgin, 200, (CGRectGetWidth(self.view.frame) - 3*K_MArgin)/2, 40);
    
    self.verticallyBtn.frame = CGRectMake(K_MArgin, 100, (CGRectGetWidth(self.view.frame) - 3*K_MArgin)/2, 40);
    
    self.horizontallyBtn.frame = CGRectMake(K_MArgin*2 + (CGRectGetWidth(self.view.frame) - 3*K_MArgin)/2, 100, (CGRectGetWidth(self.view.frame) - 3*K_MArgin)/2, 40);
    
    self.lockBtn.frame = CGRectMake(K_MArgin, 150, CGRectGetWidth(self.view.frame) - 2*K_MArgin, 40);
    
    self.tf.frame = CGRectMake(K_MArgin, 250, CGRectGetWidth(self.view.frame) - 2*K_MArgin, 40);
    
    
    UIInterfaceOrientation aInterOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (aInterOrientation == UIInterfaceOrientationPortrait) {
        NSLog(@"12");
        self.isHiddeStatusBar = NO;
        self.navigationController.navigationBar.hidden = NO;
        self.lockBtn.backgroundColor = [UIColor redColor];
    } else if (aInterOrientation == UIInterfaceOrientationLandscapeRight) {
        NSLog(@"56");
        self.isHiddeStatusBar = YES;
        self.navigationController.navigationBar.hidden = YES;
        self.lockBtn.backgroundColor = [UIColor greenColor];
    }

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

- (void)leftAction
{
    
    [self rotatScreenTo:UIInterfaceOrientationPortrait];
    
}

- (void)rightAction
{
    [self rotatScreenTo:UIInterfaceOrientationLandscapeRight];
}

- (void)didClickLock:(UIButton *)sender{
    if (self.lockScreen) {
        
        self.lockScreen = NO;
        [sender setTitle:@"屏幕解锁状态" forState:UIControlStateNormal];
    } else {
        
        self.lockScreen = YES;
        [sender setTitle:@"锁定屏幕状态" forState:UIControlStateNormal];
    }
}

- (void)pushAction
{
    ViewController *view = [[ViewController alloc] init];
    [self presentViewController:view animated:YES completion:nil];
//    [self.navigationController pushViewController:view animated:YES];
}


@end
