//
//  SEVDidLoginViewController.m
//  ShareElectricVehicles
//
//  Created by 张高强 on 2017/4/5.
//  Copyright © 2017年 ZhongHao. All rights reserved.
//

#import "SEVDidLoginViewController.h"
#import "SEVRootViewController.h"
#import "DepositRechargeViewController.h"


@interface SEVDidLoginViewController ()<UITableViewDelegate,UITableViewDataSource>
{
     NSMutableArray *_dataArr;
}
@property (strong, nonatomic) IBOutlet UITableView *tab_list;
@property (strong, nonatomic) IBOutlet UIImageView *despositChargeImage;

@end

@implementation SEVDidLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self dataInit];
    
    self.tab_list.delegate=self;
    self.tab_list.dataSource=self;
    self.tab_list.rowHeight=UITableViewAutomaticDimension;
    self.tab_list.estimatedRowHeight=300;
   
   
   
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"LoginView"owner:self options:nil];
    
    UIView *tmpCustomView = [nib objectAtIndex:0];
    
    
    self.tab_list.tableHeaderView=tmpCustomView;
    
    [self.view addSubview:self.tab_list];
    
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    [self.despositChargeImage addGestureRecognizer:tap];
    
    
    

    // Do any additional setup after loading the view from its nib.
}



-(void)tapClick:(UITapGestureRecognizer *)tap{
    
    DepositRechargeViewController *des=[[DepositRechargeViewController alloc] init];
    
    [self.navigationController pushViewController:des animated:YES];
    
    
    
}


#pragma mark - 数据初始化
- (void)dataInit {
     _dataArr =[[NSMutableArray alloc] initWithObjects:@[@"我的钱包",@"我的优惠",@"我的行程"],@[@"我的消息",@"邀请好友",@"用户指南",@"设置"],nil];
    
    
    
    
    
    
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==0) {
        return 0;
    }
    
    return 10;
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    // Return the number of rows in the section.
    
    
    return [_dataArr[section] count];
    
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 复用标志
    static NSString * cellId = @"SEVLoginCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    //
    if (cell == nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    //SEVUnLoginTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"SEVUnLoginTableViewCell"];
    
    
    
    //获取指定的数据
    cell.textLabel.text = _dataArr[indexPath.section][indexPath.row];
    
    
    return cell;
}


- (IBAction)backRootBtn:(id)sender {
    
   // SEVDidLoginViewController *sevroot=[[SEVDidLoginViewController alloc] init];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
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
