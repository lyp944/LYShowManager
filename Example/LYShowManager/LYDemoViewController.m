//
//  LYDemoViewController.m
//  LYShowManager_Example
//
//  Created by Mega on 2018/9/28.
//  Copyright © 2018 Mega. All rights reserved.
//

#import <LYShowManager/LYShowManager.h>
#import "LYDemoViewController.h"

@interface LYDemoViewController () {
    UIButton *_button;
    UIActivityIndicatorView *_activityView;

}

@end

@implementation LYDemoViewController
@synthesize ly_dismissBlock;

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button setTitle:@"show next" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    _button.translatesAutoresizingMaskIntoConstraints = NO;
    [[_button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[_button.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor] setActive:YES];
    [_button setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [_button setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];

    
    _activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activityView.hidesWhenStopped = YES;
    _activityView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_activityView];
    _activityView.translatesAutoresizingMaskIntoConstraints = NO;
    [[_activityView.centerXAnchor constraintEqualToAnchor:_button.centerXAnchor] setActive:YES];
    [[_activityView.centerYAnchor constraintEqualToAnchor:_button.centerYAnchor] setActive:YES];
    [[_activityView.widthAnchor constraintEqualToAnchor:_button.widthAnchor] setActive:YES];
    [[_activityView.heightAnchor constraintEqualToAnchor:_button.heightAnchor] setActive:YES];
    [_activityView stopAnimating];
}

-(void)buttonClick:(UIButton*)sender {
    
    /*
    LYDemoViewController *vc1 = [[LYDemoViewController alloc]init];
    vc1.view.backgroundColor = [UIColor redColor];
    [[LYShowManager sharedManager].queueArray addObject:vc1];
    */
    
    if (!self.ly_dismissBlock) return;

    
    [_activityView startAnimating];
    __weak typeof(self) weakSelf = self;
    
    self.ly_dismissBlock(^{
        __strong typeof(weakSelf) self = weakSelf;
        [self->_activityView stopAnimating];
    });
    
}

#pragma mark - <LYShowProtocol>

+(void)ly_shouldShow:(LYShowProtocolShouldShowBlock)shouldShowBlock {
    if (shouldShowBlock) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            shouldShowBlock(YES);
        });
    }
}


@end
