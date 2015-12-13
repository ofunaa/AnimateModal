//
//  AnimateModal.m
//  AnimateModal
//
//  Created by takuji funao on 2015/12/11.
//  Copyright (c) 2015年 takuji funao. All rights reserved.
//
#import "AnimateModal.h"

@implementation AnimateModal{
    
    float animation_time;
    float animation_size;

}

-(void)CreateModal:(UIView*)MainView title:(NSString*)title{
    
    UIScreen *sc = [UIScreen mainScreen];
    CGRect rect = sc.bounds;
    
    _modalBg =[[UIView alloc] initWithFrame:CGRectMake(0,0,rect.size.width,rect.size.height)];
    _modalBg.backgroundColor =  [UIColor colorWithWhite:0 alpha:0.8];
    [MainView addSubview: _modalBg];
    
    [self CreateModalTitle:title];

}

-(void)CreateModalTitle:(NSString*)title{
    UIScreen *sc = [UIScreen mainScreen];
    CGRect rect = sc.bounds;
    
    _mainBg =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 280,140)];
    _mainBg.center = CGPointMake(rect.size.width/2, rect.size.height);
    
    [_mainBg setAlpha:0.0];
    _mainBg.backgroundColor = [UIColor colorWithWhite:0 alpha:1];
    
    [self CreateModalTitleAnimation];
    
    _mainBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _mainBtn.frame = CGRectMake(0, 0, 280, 25);
    _mainBtn.center = CGPointMake(_mainBg.frame.size.width/2, _mainBg.frame.size.height/2);
    [_mainBtn setTitle:(title) forState:UIControlStateNormal];
    [_mainBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
    _mainBtn.tintColor = [UIColor colorWithRed:0.238 green:0.501 blue:0.593 alpha:1.000];
    _mainBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_mainBg addSubview:_mainBtn];
    
    [self CreateCloseBtn];
    
}

- (void)CreateModalTitleAnimation{
    UIScreen *sc = [UIScreen mainScreen];
    CGRect rect = sc.bounds;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationDelegate:self];
    [_mainBg setAlpha:1];
    _mainBg.center = CGPointMake(rect.size.width/2, 200);
    _mainBg.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    [_modalBg addSubview:_mainBg];
    [UIView setAnimationDidStopSelector:@selector(Created_ModalTitleBtn)];
    [UIView commitAnimations];

}

- (void)Created_ModalTitleBtn{
    UIScreen *sc = [UIScreen mainScreen];
    CGRect rect = sc.bounds;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.2];
    _mainBg.center = CGPointMake(rect.size.width/2, 280);
    _mainBg.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    [UIView commitAnimations];
}


-(void)CreateCloseBtn{
    UIScreen *sc = [UIScreen mainScreen];
    CGRect rect = sc.bounds;
    
    _closeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _closeBtn.frame = CGRectMake(0,0,90,90);
    _closeBtn.center = CGPointMake(rect.size.width/2, rect.size.height-70);
    _closeBtn.tintColor = [UIColor colorWithRed:0.238 green:0.501 blue:0.593 alpha:1.000];
    _closeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    _closeBtn.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    
    [[_closeBtn layer] setCornerRadius:45.0];
    [[_closeBtn layer]setBorderColor:[[UIColor whiteColor] CGColor]];
    [[_closeBtn layer]setBorderWidth:0.7f];
    
    [_closeBtn setClipsToBounds:YES];
    [_closeBtn setTitle:@"close" forState:UIControlStateNormal];
    [_closeBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    _closeBtn.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    _closeBtn.transform = CGAffineTransformMakeRotation(M_PI * 1);
    [_modalBg addSubview:_closeBtn];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationDelegate:self];
    _closeBtn.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    _closeBtn.transform = CGAffineTransformMakeRotation(M_PI * 2);
    [_closeBtn addTarget:self action:@selector(tapCloseBtn) forControlEvents:UIControlEventTouchUpInside];
    [UIView commitAnimations];
    
    
    
}


-(void)tapCloseBtn{
    UIScreen *sc = [UIScreen mainScreen];
    CGRect rect = sc.bounds;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationDelegate:self];
    
    [[_mainBg layer] setCornerRadius:45.0];
    [[_mainBg layer]setBorderColor:[[UIColor whiteColor] CGColor]];
    [[_mainBg layer]setBorderWidth:0.7f];
    [_mainBg setClipsToBounds:YES];
    
    _mainBg.frame = CGRectMake(0,0,90,90);
    _mainBg.center = CGPointMake(rect.size.width/2, 280);
    _mainBg.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    _mainBg.transform = CGAffineTransformMakeRotation(M_PI * 1);
    
    _closeBtn.center = CGPointMake(_mainBg.center.x, _mainBg.center.y);
    _closeBtn.tintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.000];
    [_closeBtn setTitle:@"OK!" forState:UIControlStateNormal];
    
    _mainBtn.frame = CGRectMake(0, 0, 90, 90);
    _mainBtn.center = CGPointMake(_mainBg.frame.size.width/2, _mainBg.frame.size.height/2);
    _mainBtn.tintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.000];
    _mainBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_mainBtn setTitle:@"OK!" forState:UIControlStateNormal];
    [_mainBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationDelegate:self];
    _mainBg.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    _mainBg.transform = CGAffineTransformMakeRotation(M_PI * 2);
    [UIView setAnimationDidStopSelector:@selector(removeModal)];
    [UIView commitAnimations];
    
}

- (void)removeModal{
    UIScreen *sc = [UIScreen mainScreen];
    CGRect rect = sc.bounds;
    
    animation_time = 3.0;
    animation_size = 90.0;
    
    [_closeBtn removeFromSuperview];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.1];
    [UIView setAnimationDelegate:self];
    
    _mainBg.frame = CGRectMake(0,0,animation_size,animation_size);
    _mainBg.center = CGPointMake(rect.size.width/2, 280);
    
    [_mainBtn setTitle:@"" forState:UIControlStateNormal];
    [UIView setAnimationDidStopSelector:@selector(removeModal_loop)];
    [UIView commitAnimations];
}

- (void)removeModal_loop{
    UIScreen *sc = [UIScreen mainScreen];
    CGRect rect = sc.bounds;
    
    if(animation_time < 0){
        
        [[_mainBg layer]setBorderWidth:0];
        [self removeModals];
        
    }else{
        
        animation_time = animation_time - 0.1;
        animation_size = animation_size + 8.0;
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.01/2];
        [UIView setAnimationDelegate:self];
        
        _mainBg.frame = CGRectMake(0, 0, animation_size, animation_size);
        _mainBg.center = CGPointMake(rect.size.width/2, 280);
        
        _mainBg.backgroundColor = [UIColor colorWithWhite:1 alpha:animation_time/3];
        
        [[_mainBg layer] setCornerRadius:animation_size/2];
        
        [UIView setAnimationDidStopSelector:@selector(removeModal_loop)];
        [UIView commitAnimations];
        
    }
    
}

- (void)removeModals{
    [_modalBg removeFromSuperview];
}

@end

