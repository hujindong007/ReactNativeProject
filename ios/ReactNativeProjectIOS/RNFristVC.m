//
//  RNFristVC.m
//  ReactNativeProjectIOS
//
//  Created by FangSu on 2023/6/6.
//  Copyright © 2023 王家强. All rights reserved.
//

#import "RNFristVC.h"

//react native 入口
#import <React/RCTRootView.h>

@interface RNFristVC ()

@end

@implementation RNFristVC

#pragma mark ---------- Life Cycle -----------

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addAllSubView];

}


#pragma mark ---------- NetWork -------------

#pragma mark ---------- Methods --------------

- (void)addAllSubView
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.backgroundColor = [UIColor whiteColor];
    leftButton.frame = CGRectMake(0, 0, 44, 44);
    [leftButton setTitle:@"RN" forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(pushRNClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
}

#pragma mark ---------- Click Event ----------

- (void)pushRNClick
{
    NSLog(@"High Score Button Pressed");
    
    UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//           [self deleteWebCache];
//           [self removeAllSubview];
//           if ([self.singOutType isEqualToString:@"1"]) {
//               [self.navigationController popViewControllerAnimated:YES];
//           }else{
//               [self signOut];
//               exit(0);
//           }
       }];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"分享成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:doneAction];
        [self presentViewController:alertController animated:YES completion:nil];

//    //注意  代码中的​​localhost​​改为你电脑的IP地址
//    //    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
//    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://192.168.50.149:8081/index.bundle?platform=ios"];
//    RCTRootView *rootView =
//      [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
//                                  moduleName: @"ReactApplicationMain"
//                           initialProperties:
//                             @{
//                               @"scores" : @[
//                                 @{
//                                   @"name" : @"Alex",
//                                   @"value": @"42"
//                                  },
//                                 @{
//                                   @"name" : @"Joel",
//                                   @"value": @"10"
//                                 }
//                               ]
//                             }
//                               launchOptions: nil];
//
//
//    UIViewController *vc = [[UIViewController alloc] init];
//    vc.view = rootView;
//    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark ---------- Delegate -------------

#pragma mark ---------- SET&&GET -------------

#pragma mark ---------- Lazy Load ------------


@end
