//
//  MAMainViewController.m
//  MASimplestSemiModelViewControllerDemo
//
//  Created by Marlon Andrade on 30/07/13.
//  Copyright (c) 2013 Marlon Andrade. All rights reserved.
//

#import "MAMainViewController.h"

#import "UIViewController+MASimplestSemiModal.h"

@interface MAMainViewController ()

@property (nonatomic, strong) UIView *semiView;

- (void)_showSemiModal:(id)sender;

@end

@implementation MAMainViewController

#pragma mark - Getter

- (UIView *)semiView {
    if (!_semiView) {
        _semiView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, self.view.bounds.size.width, 200.f)];
        _semiView.backgroundColor = [UIColor magentaColor];
        _semiView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    }
    return _semiView;
}

#pragma mark - UIViewController Methods

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:0.22f green:0.55f blue:0.45f alpha:1.f];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0.f, 0.f, 150.f, 44.f);
    button.center = self.view.center;
    button.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
                               UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);

    button.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.3f];
    [button setTitle:@"Semi modal" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(_showSemiModal:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:button];
}

#pragma mark - Private Interface

- (void)_showSemiModal:(id)sender {
    [self presentSemiView:self.semiView];
}

@end
