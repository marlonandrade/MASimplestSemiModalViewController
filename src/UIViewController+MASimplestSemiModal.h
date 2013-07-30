//
//  UIViewController+MASimplestSemiModal.h
//  MASimplestSemiModelViewControllerDemo
//
//  Created by Marlon Andrade on 30/07/13.
//  Copyright (c) 2013 Marlon Andrade. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MASimplestSemiModal)

- (void)presentSemiView:(UIView *)view;
- (void)dismissSemiView;

@end
