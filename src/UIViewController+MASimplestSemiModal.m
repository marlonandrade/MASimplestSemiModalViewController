//
//  UIViewController+MASimplestSemiModal.m
//  MASimplestSemiModalViewControllerDemo
//
//  Created by Marlon Andrade on 30/07/13.
//  Copyright (c) 2013 Marlon Andrade. All rights reserved.
//

#import "UIViewController+MASimplestSemiModal.h"

#import <objc/runtime.h>

#define MA_SEMI_MODAL_ANIMATION_DURATION 0.5f
#define MA_SEMI_MODAL_OVERLAY_ALPHA 0.5f

#define kSemiModalPresentingViewController @"kSemiModalPresentingViewController"

@interface UIViewController (MASimplestSemiView)

- (void)_presentSemiView:(UIView *)view completion:(void(^)())completionBlock;
- (void)_overlayTapRecognized:(UIGestureRecognizer *)gestureRecognizer;

@end

@implementation UIViewController (MASimplestSemiModal)

#pragma mark - Public Methods

- (void)ma_presentSemiView:(UIView *)view {
    [self _presentSemiView:view completion:NULL];
}

- (void)ma_dismissSemiView {
    UIApplication *app = [UIApplication sharedApplication];

    UIViewController *presentingViewController = objc_getAssociatedObject(app, kSemiModalPresentingViewController);

    UIView *target = presentingViewController.view;
    UIView *container = target.subviews.lastObject;
    UIView *overlay = container.subviews.firstObject;
    UIView *semiModal = container.subviews.lastObject;

    [UIView animateWithDuration:MA_SEMI_MODAL_ANIMATION_DURATION animations:^{
        semiModal.frame = CGRectMake(0.f, target.bounds.size.height,
                                     semiModal.bounds.size.width, semiModal.bounds.size.height);
        overlay.alpha = 0.f;
    } completion:^(BOOL finished) {
        [container removeFromSuperview];

        objc_setAssociatedObject(app, kSemiModalPresentingViewController, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }];
}

#pragma mark - Private Interface

- (void)_presentSemiView:(UIView *)view completion:(void (^)())completionBlock {
    if (![self.view.subviews containsObject:view]) {
        objc_setAssociatedObject([UIApplication sharedApplication], kSemiModalPresentingViewController,
                                 self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        UIView *container = [[UIView alloc] initWithFrame:self.view.bounds];
        container.backgroundColor = [UIColor clearColor];
        container.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

        UIView *overlay = [[UIView alloc] initWithFrame:self.view.bounds];
        overlay.backgroundColor = [UIColor blackColor];
        overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        overlay.alpha = 0.f;
        overlay.gestureRecognizers = @[[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                               action:@selector(_overlayTapRecognized:)]];

        [container addSubview:overlay];

        view.frame = CGRectMake(0.f, self.view.bounds.size.height,
                                view.bounds.size.width, view.bounds.size.height);
        view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;

        [container addSubview:view];

        [self.view addSubview:container];

        [UIView animateWithDuration:MA_SEMI_MODAL_ANIMATION_DURATION animations:^{
            overlay.alpha = MA_SEMI_MODAL_ANIMATION_DURATION;
            view.frame = CGRectMake(0.f, self.view.bounds.size.height - view.bounds.size.height,
                                    view.bounds.size.width, view.bounds.size.height);
        } completion:^(BOOL finished) {
            if (finished && completionBlock) completionBlock();
        }];
    }
}

- (void)_overlayTapRecognized:(UIGestureRecognizer *)gestureRecognizer {
    [self ma_dismissSemiView];
}

@end
