//
//  DemoTableViewController.m
//  ReactNativeProjectIOS
//
//  Created by 王家强 on 2019/6/13.
//  Copyright © 2019 王家强. All rights reserved.
//

#import "DemoTableViewController.h"
#import "DemoDataKey.h"
#import "DemoTableViewCell.h"
#import "RNFristVC.h"

@interface DemoTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *dataArr;

@end

@implementation DemoTableViewController




#pragma mark ---------- Life Cycle -----------

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Demo";
    
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.backgroundColor = [UIColor whiteColor];
    leftButton.frame = CGRectMake(0, 0, 44, 44);
    [leftButton setTitle:@"RN" forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(pushRNClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    
    // 自动布局
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44;

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.tableView registerClass:[DemoTableViewCell class] forCellReuseIdentifier:NSStringFromClass([DemoTableViewCell class])];
    [self.tableView reloadData];
    
}

#pragma mark ---------- NetWork -------------

#pragma mark ---------- Methods --------------

#pragma mark ---------- Click Event ----------

- (void)pushRNClick
{
    RNFristVC * rnVC = [[RNFristVC alloc]init];
    [self.navigationController pushViewController:rnVC animated:YES];
}

#pragma mark ---------- Delegate -------------

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DemoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DemoTableViewCell class]) forIndexPath:indexPath];
    [cell setModel:self.dataArr[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoTableViewController * demo = [[DemoTableViewController alloc]init];
    demo.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:demo animated:YES completion:nil];
//    typedef NS_ENUM(NSInteger, UIModalPresentationStyle) {
//        UIModalPresentationFullScreen = 0,
//        UIModalPresentationPageSheet API_AVAILABLE(ios(3.2)) API_UNAVAILABLE(tvos),
//        UIModalPresentationFormSheet API_AVAILABLE(ios(3.2)) API_UNAVAILABLE(tvos),
//        UIModalPresentationCurrentContext API_AVAILABLE(ios(3.2)),
//        UIModalPresentationCustom API_AVAILABLE(ios(7.0)),
//        UIModalPresentationOverFullScreen API_AVAILABLE(ios(8.0)),
//        UIModalPresentationOverCurrentContext API_AVAILABLE(ios(8.0)),
//        UIModalPresentationPopover API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(tvos),
//        UIModalPresentationBlurOverFullScreen API_AVAILABLE(tvos(11.0)) API_UNAVAILABLE(ios) API_UNAVAILABLE(watchos),
//        UIModalPresentationNone API_AVAILABLE(ios(7.0)) = -1,
//        UIModalPresentationAutomatic API_AVAILABLE(ios(13.0)) = -2,
//    };
}


#pragma mark ---------- SET&&GET -------------

#pragma mark ---------- Lazy Load ------------

- (NSArray *)dataArr
{
//    _totalArray = @[@"历史记录地脚螺栓简单逻辑受打击了设计等级三利达进啦手机溜达鸡拉萨较大猎杀对决老实交代就算了登记了手机倒垃圾时老大",@"塑料袋三六九等老实交代垃圾收垃圾到啦手机倒垃圾时溜达鸡拉萨的",@"水利电力时间来得及十六大",@"塑料袋就算了",@"历史记录地脚螺栓简单逻辑受打击了设计等级三利达进啦手机溜达鸡拉萨较大猎杀对决老实交代就算了登记了手机倒垃圾时老大"];
    
    return @[
             @[@{
                   DemoCollctionItemName : @"历史记录地脚螺栓简单逻辑受打击了设计等级三利达进啦手机溜达鸡拉萨较大猎杀对决老实交代就算了登记了手机倒垃圾时老大",
                   DemoCollctionItemImage: @"avatar.jpg"
                   },
               @{
                   DemoCollctionItemName : @"塑料袋三六九等老实交代垃圾收垃圾到啦手机倒垃圾时溜达鸡拉萨的",
                   DemoCollctionItemImage: @"avatar.jpg"
                   },
               @{
                   DemoCollctionItemName : @"水利电力时间来得及十六大",
                   DemoCollctionItemImage: @"avatar.jpg"
                   },
               @{
                   DemoCollctionItemName : @"塑料袋就算了",
                   DemoCollctionItemImage: @"avatar.jpg"
                   },
               @{
                   DemoCollctionItemName : @"哈哈哈5",
                   DemoCollctionItemImage: @"avatar.jpg"
                   }],
             
             @[@{
                   DemoCollctionItemName : @"历史记录地脚螺栓简单逻辑受打击了设计等级三利达进啦手机溜达鸡拉萨较大猎杀对决老实交代就算了登记了手机倒垃圾时老大",
                   DemoCollctionItemImage: @"avatar.jpg"
                   },
               @{
                   DemoCollctionItemName : @"哈哈哈1",
                   DemoCollctionItemImage: @"avatar.jpg"
                   }],
//
//
             @[@{
                   DemoCollctionItemName : @"哈哈哈0",
                   DemoCollctionItemImage: @"avatar.jpg"
                   },
               @{
                   DemoCollctionItemName : @"历史记录地脚螺栓简单逻辑受打击了设计等级三利达进啦手机溜达鸡拉萨较大猎杀对决老实交代就算了登记了手机倒垃圾时老大",
                   DemoCollctionItemImage: @"avatar.jpg"
                   },
               @{
                   DemoCollctionItemName : @"塑料袋就算了",
                   DemoCollctionItemImage: @"avatar.jpg"
                   },
               @{
                   DemoCollctionItemName : @"哈哈哈3",
                   DemoCollctionItemImage: @"avatar.jpg"
                   }]
             ];
}



@end
