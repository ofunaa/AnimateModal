//
//  AnimateModalViewController.m
//  AnimateModal
//
//  Created by takujifunao on 12/13/2015.
//  Copyright (c) 2015 takujifunao. All rights reserved.
//

#import "AnimateModalViewController.h"
#import "AnimateModal.h"

@interface AnimateModalViewController ()

@end

@implementation AnimateModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScreen* sc = [UIScreen mainScreen];
    CGRect rect = sc.bounds;
    
    
    UIButton* modalBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    modalBtn.frame = CGRectMake(0,0, rect.size.width/2, 80);
    modalBtn.center = CGPointMake(rect.size.width/2, rect.size.height/2);
    modalBtn.tintColor = [UIColor colorWithWhite:1 alpha:1];
    modalBtn.backgroundColor = [UIColor colorWithRed:0.238 green:0.501 blue:0.593 alpha:1.000];
    modalBtn.contentHorizontalAlignment = 0;
    [modalBtn setTitle:@"Modal" forState:UIControlStateNormal];
    [modalBtn addTarget:self action:@selector(tapBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:modalBtn];
    
}

- (void)tapBtn{
    AnimateModal* aniMo = [[AnimateModal alloc] init];
    [aniMo CreateModal:self.view title:@"demo"];
    
    UIButton* btn = [aniMo mainBtn];
    [btn addTarget:self action:@selector(tapModalBtn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)tapModalBtn{
    NSLog(@"demo");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
