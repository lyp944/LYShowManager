# LYShowManager

[![CI Status](https://img.shields.io/travis/Mega/LYShowManager.svg?style=flat)](https://travis-ci.org/Mega/LYShowManager)
[![Version](https://img.shields.io/cocoapods/v/LYShowManager.svg?style=flat)](https://cocoapods.org/pods/LYShowManager)
[![License](https://img.shields.io/cocoapods/l/LYShowManager.svg?style=flat)](https://cocoapods.org/pods/LYShowManager)
[![Platform](https://img.shields.io/cocoapods/p/LYShowManager.svg?style=flat)](https://cocoapods.org/pods/LYShowManager)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

LYShowManager is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LYShowManager'
```
## Usage

```
	LYDemoViewController *vc0 = [[LYDemoViewController alloc]init];
	vc0.view.backgroundColor = [UIColor greenColor];
	
	LYDemoViewController *vc1 = [[LYDemoViewController alloc]init];
	vc1.view.backgroundColor = [UIColor orangeColor];
	
	
	[LYShowManager sharedManager].queueArray = @[vc0,vc1].mutableCopy;
	
	//push
	[[LYShowManager sharedManager]configWithController:self actionBlock:^(UIViewController *root, UIViewController *previousViewController, UIViewController *currentViewController) {
		
		NSLog(@"action:\n%@ %@ %@",root,previousViewController,currentViewController);
		//展示 code
		[root presentViewController:currentViewController animated:YES completion:nil];
		
	} unactionBlock:^(UIViewController *root, UIViewController *previousViewController, UIViewController *currentViewController) {
		
		NSLog(@"unaction:\n%@ %@ %@",root,previousViewController,currentViewController);
		
		//消失 code
		[previousViewController dismissViewControllerAnimated:YES completion:nil];
		
		
	}quitBlock:^(UIViewController * _Nonnull root, UIViewController * _Nonnull previousViewController) {
		NSLog(@"quit:\n%@ %@",root,previousViewController);
		
		//LYShowManager 结束了
		[previousViewController dismissViewControllerAnimated:YES completion:nil];
		
		
	}];
	
	
	[[LYShowManager sharedManager]startShow];
```
## Author

Liyunpeng, lypworkon@sina.com

## License

LYShowManager is available under the MIT license. See the LICENSE file for more info.


