//
//  UIViewController+MASimplestSemiModal.h
//  MASimplestSemiModalViewControllerDemo
//
//  Created by Marlon Andrade on 30/07/13.
//  Copyright (c) 2013 Marlon Andrade. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MASimplestSemiModal)

- (void)ma_presentSemiView:(UIView *)view;
- (void)ma_dismissSemiView;

@end
