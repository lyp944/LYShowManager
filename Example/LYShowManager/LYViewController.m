//
//  LYViewController.m
//  LYShowManager_Example
//
//  Created by Mega on 2018/9/29.
//  Copyright © 2018 Mega. All rights reserved.
//

#import "LYDemoViewController.h"
#import <LYShowManager/LYShowManager.h>
#import "LYViewController.h"

@interface LYViewController ()

@end

@implementation LYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)present:(id)sender {
    
    LYDemoViewController *vc0 = [[LYDemoViewController alloc]init];
    vc0.view.backgroundColor = [UIColor greenColor];
    
    LYDemoViewController *vc1 = [[LYDemoViewController alloc]init];
    vc1.view.backgroundColor = [UIColor orangeColor];
    
    
    [LYShowManager sharedManager].queueArray = @[vc0,vc1].mutableCopy;
    
    //push
    [[LYShowManager sharedManager]configWithController:self actionBlock:^(UIViewController *root, UIViewController *previousViewController, UIViewController *currentViewController) {
        
        NSLog(@"action:\n%@ %@ %@",root,previousViewController,currentViewController);
        
        [root presentViewController:currentViewController animated:YES completion:nil];
        
    } unactionBlock:^(UIViewController *root, UIViewController *previousViewController, UIViewController *currentViewController) {
        
        NSLog(@"unaction:\n%@ %@ %@",root,previousViewController,currentViewController);
        
        [previousViewController dismissViewControllerAnimated:YES completion:nil];
        
        
    }quitBlock:^(UIViewController * _Nonnull root, UIViewController * _Nonnull previousViewController) {
        NSLog(@"quit:\n%@ %@",root,previousViewController);
        
        
        [previousViewController dismissViewControllerAnimated:YES completion:nil];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"结束" message:@"进入主界面" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [self presentViewController:alert animated:YES completion:nil];
        
    }];
    
    
    [[LYShowManager sharedManager]startShow];
    
}

@end
