//
//  CertifationViewController.m
//  ShareElectricVehicles
//
//  Created by 张高强 on 2017/4/7.
//  Copyright © 2017年 ZhongHao. All rights reserved.
//

#import "CertifationViewController.h"
#import "SEVLoginViewController.h"

@interface CertifationViewController ()
@property (strong, nonatomic) IBOutlet UITextField *name;

@property (strong, nonatomic) IBOutlet UITextField *identify;

@end

@implementation CertifationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)popToRoot:(id)sender {
  
    for (UIViewController *convc in self.navigationController.viewControllers) {
        if ([convc isKindOfClass:[SEVLoginViewController class]]) {
            [self.navigationController popToViewController:convc animated:YES];
        }
    }
    
}

- (IBAction)identifyBtn:(id)sender {
    if ( ![self IsIdentityCard:self.identify.text  ] ) {
        NSLog(@"不是身份证号");
        return;
        
    }
}


-(BOOL) IsIdentityCard:(NSString *)IDCardNumber
{
    if (IDCardNumber.length <= 0) {
        return NO;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:IDCardNumber];
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
