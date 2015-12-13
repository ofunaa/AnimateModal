//
//  AnimateModal.h
//  AnimateModal
//
//  Created by takuji funao on 2015/12/11.
//  Copyright (c) 2015年 takuji funao. All rights reserved.
//
@import UIKit;
#import <Foundation/Foundation.h>

@interface AnimateModal : NSObject

@property (strong, nonatomic) IBOutlet UIView* modalBg;
@property (strong, nonatomic) IBOutlet UIView* mainBg;
@property (strong, nonatomic) IBOutlet UIButton* mainBtn;
@property (strong, nonatomic) IBOutlet UIButton *closeBtn;


-(void)CreateModal:(UIView*)MainView title:(NSString*) title;

-(void)CreateCloseBtn;

-(void)tapCloseBtn;


@end
