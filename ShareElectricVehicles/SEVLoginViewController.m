//
//  SEVLoginViewController.m
//  ShareElectricVehicles
//
//  Created by 张高强 on 2017/4/5.
//  Copyright © 2017年 ZhongHao. All rights reserved.
//

#import "SEVLoginViewController.h"
#import "SEVDidLoginViewController.h"
#import "DepositRechargeViewController.h"

@interface SEVLoginViewController ()<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *phoneNum;

@property (strong, nonatomic) IBOutlet UITextField *identifyCode;

@property (strong, nonatomic) IBOutlet UILabel *identifyLabel;

@end

@implementation SEVLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.phoneNum resignFirstResponder];
    [self.identifyCode resignFirstResponder];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}




- (IBAction)buttonEvent:(UIButton *)sender {
    switch (sender.tag-1000) {
        case 1:
            [self.navigationController popViewControllerAnimated:YES];
            
            break;
            
            
        case 2:
        {
            
            
            SEVDidLoginViewController *sevDidLogin=[[SEVDidLoginViewController alloc] init];
           // DepositRechargeViewController *des=[[DepositRechargeViewController alloc] init];
         //   [self presentViewController:des animated:YES completion:nil];
            //[sevDidLogin.navigationController pushViewController:des animated:YES];
            
            
            
           [self.navigationController pushViewController:sevDidLogin animated:NO];
            
            
            
        }
            
            break;
            
        default:
            break;
    }
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
