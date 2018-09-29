//
//  LYPushViewController.m
//  LYShowManager_Example
//
//  Created by Mega on 2018/9/29.
//  Copyright © 2018 Mega. All rights reserved.
//

#import "LYDemoViewController.h"
#import <LYShowManager/LYShowManager.h>
#import "LYPushViewController.h"

@interface LYPushViewController ()

@end

@implementation LYPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    LYDemoViewController *vc0 = [[LYDemoViewController alloc]init];
    vc0.view.backgroundColor = [UIColor greenColor];
    
    LYDemoViewController *vc1 = [[LYDemoViewController alloc]init];
    vc1.view.backgroundColor = [UIColor orangeColor];
    
    LYDemoViewController *vc2 = [[LYDemoViewController alloc]init];
    vc2.view.backgroundColor = [UIColor purpleColor];
    
    [LYShowManager sharedManager].queueArray = @[vc0,vc1,vc2].mutableCopy;
    
    //push
    [[LYShowManager sharedManager]configWithController:self actionBlock:^(UIViewController *root, UIViewController *previousViewController, UIViewController *currentViewController) {
        
        NSLog(@"action:\n%@ %@ %@",root,previousViewController,currentViewController);
        
        UINavigationController *nav = (UINavigationController*)root;
        currentViewController.hidesBottomBarWhenPushed = YES;
        [nav pushViewController:currentViewController animated:YES];
        
    } unactionBlock:^(UIViewController *root, UIViewController *previousViewController, UIViewController *currentViewController) {
        
        NSLog(@"unaction:\n%@ %@ %@",root,previousViewController,currentViewController);
        
        
        //push
        UINavigationController *nav = (UINavigationController*)root;
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(UINavigationControllerHideShowBarDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            NSMutableArray *copyViewControllers = nav.viewControllers.mutableCopy;
            [copyViewControllers removeObject:previousViewController];
            nav.viewControllers = copyViewControllers;
        });
        
        
    }quitBlock:^(UIViewController * _Nonnull root, UIViewController * _Nonnull previousViewController) {
        NSLog(@"quit:\n%@ %@",root,previousViewController);
        
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"结束" message:@"进入主界面" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [self presentViewController:alert animated:YES completion:nil];
    }];
    
    
    [[LYShowManager sharedManager]startShow];
    
    
}



@end
