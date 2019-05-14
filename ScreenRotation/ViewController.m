//
//  ViewController.m
//  ScreenRotation
//
//  Created by AoChen on 2019/5/13.
//  Copyright © 2019 ac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    self.lockScreen = NO;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self rotatScreenTo:UIInterfaceOrientationLandscapeRight];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
  
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.lockScreen = YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
//    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
