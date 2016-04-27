//
//  XYViewController.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/4/25.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYViewController.h"

@interface XYViewController ()

@end

@implementation XYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showBarButton:NAV_LEFT title:@"返回" fontColor:[UIColor redColor]];
    UIButton *v = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [v addTarget:self action:@selector(clickbtn) forControlEvents:UIControlEventTouchUpInside];
    v.backgroundColor = [UIColor redColor];
    [self.view addSubview:v];
}

- (void)clickbtn
{
    XYViewController *c = [[XYViewController alloc] init];
    [self.navigationController pushViewController:c animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
