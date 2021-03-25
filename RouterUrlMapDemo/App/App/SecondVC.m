//
//  SecondVC.m
//  RouterUrlMapDemo
//
//  Created by 李臣臣 on 2021/3/25.
//

#import "SecondVC.h"
#import "RouterManager.h"


@interface SecondVC ()

@property (nonatomic, copy) NSString *returnData;

@end

@implementation SecondVC

+ (void)load{
    [RouterManager bindURL:Router_SecondeVC toHandler:^id _Nullable(NSDictionary * _Nonnull parameter) {
        NSString *pushID = [parameter objectForKey:@"push_id"];
        SecondVC *vc = [SecondVC new];
        vc.pushID = pushID;
        return vc;
    } compeleteData:^id _Nonnull(SecondVC *sourceObj) {
        return @{@"returnObj": @"我是回传数据"};
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  = UIColor.whiteColor;
    
    NSLog(@"--------->%@", self.pushID);
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
