//
//  CustomLeftSpaceExampleVC.m
//  XLPageViewControllerExample
//
//  Created by 追风者 on 2021/1/7.
//  Copyright © 2021 jwzt. All rights reserved.
//

#import "CustomLeftSpaceExampleVC.h"
#import "XLPageViewController.h"
#import "CommonTableViewController.h"

@interface CustomLeftSpaceExampleVC ()<XLPageViewControllerDelegate,XLPageViewControllerDataSrouce>
@property (nonatomic, strong) XLPageViewController *pageViewController;
@end

@implementation CustomLeftSpaceExampleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
 
    [self initPageViewController];
    
    UIButton *leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbtn setTitle:@"选择类型" forState:UIControlStateNormal];
    [leftbtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    leftbtn.titleLabel.font = [UIFont systemFontOfSize:16];
    leftbtn.frame = CGRectMake(0, 0, 100, 40);
    [self.view addSubview:leftbtn];
}

- (void)initPageViewController {
    XLPageViewControllerConfig *config = [XLPageViewControllerConfig defaultConfig];
    config.titleLeftSpace = 100;

    self.pageViewController = [[XLPageViewController alloc] initWithConfig:config];
    self.pageViewController.view.frame = self.view.bounds;
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource = self;
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
}

#pragma mark -
#pragma mark TableViewDelegate&DataSource
- (UIViewController *)pageViewController:(XLPageViewController *)pageViewController viewControllerForIndex:(NSInteger)index {
    CommonTableViewController *vc = [[CommonTableViewController alloc] init];
    return vc;
}

- (NSString *)pageViewController:(XLPageViewController *)pageViewController titleForIndex:(NSInteger)index {
    return self.titles[index];
}

- (NSInteger)pageViewControllerNumberOfPage {
    return self.titles.count;
}

- (void)pageViewController:(XLPageViewController *)pageViewController didSelectedAtIndex:(NSInteger)index {
    NSLog(@"切换到了：%@",self.titles[index]);
}


- (NSArray *)titles {
    return @[@"关注",@"推荐",@"热点",@"问答",@"科技",@"国风",@"直播",@"新时代",@"北京",@"国际",@"数码",@"小说",@"军事"];
}

@end
