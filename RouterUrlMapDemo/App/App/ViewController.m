//
//  ViewController.m
//  RouterUrlMapDemo
//
//  Created by 李臣臣 on 2021/3/24.
//

#import "ViewController.h"
#import "RouterManager.h"
#import <CommonModul/CommonModul.h>


@interface ViewController ()

@end

@implementation ViewController

+ (void)load{
    [RouterManager bindURL:Router_ViewController toHandler:^id _Nullable(NSDictionary * _Nonnull parameter) {
        return [UIViewController new];
    }];
    
}

- (IBAction)btnTouchAction:(id)sender {
    
    
    id vc =
    [RouterManager handleURL:Router_SecondeVC complexParams:@{@"push_id": @"我是参数"}  completion:^(id  _Nonnull data) {
        NSLog(@"完成回调:%@",data);
    }];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


@end
