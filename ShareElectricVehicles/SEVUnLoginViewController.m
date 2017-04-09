//
//  SEVUnLoginViewController.m
//  ShareElectricVehicles
//
//  Created by 张高强 on 2017/4/5.
//  Copyright © 2017年 ZhongHao. All rights reserved.
//

#import "SEVUnLoginViewController.h"
#import "MyModels.h"
#import "SEVUnLoginTableViewCell.h"
#import "SEVLoginViewController.h"



@interface SEVUnLoginViewController ()<UITableViewDelegate,UITableViewDataSource>
{
      NSMutableArray *_dataArr;
}

//@property(strong,nonatomic)UITableView *tab_list;
@property (strong, nonatomic) IBOutlet UITableView *tab_list;

@end

@implementation SEVUnLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

        [self dataInit];
//    self.tab_list=[[UITableView alloc] initWithFrame:CGRectMake(0,64, self.view.bounds.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    
    self.tab_list.delegate=self;
    self.tab_list.dataSource=self;
    self.tab_list.rowHeight=UITableViewAutomaticDimension;
    self.tab_list.estimatedRowHeight=300;
    [self.tab_list registerNib:[UINib nibWithNibName:@"SEVUnLoginTableViewCell" bundle:nil] forCellReuseIdentifier:@"SEVUnLoginTableViewCell"];
    self.automaticallyAdjustsScrollViewInsets = false;
  
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HeadView"owner:self options:nil];
    
    UIView *tmpCustomView = [nib objectAtIndex:0];

    
    self.tab_list.tableHeaderView=tmpCustomView;
    
    [self.view addSubview:self.tab_list];
    
    


    
    // Do any additional setup after loading the view from its nib.
}

- (void)dataInit {
    //数据来源
    //1.本地数据 (从沙盒中获取解析数据) 、写一些固定数据
    //2.网络数据 (从服务器下载数据，下载完成之后，解析)
    
    //先创建一个空数组
    _dataArr = [[NSMutableArray alloc] init];
    
 
    for (NSInteger i = 0; i < 4; i++) {
        
        HeadModels *headModel=[[HeadModels alloc] init];
      headModel.headtitle=@"头标题";
    
    [_dataArr addObject:headModel];
    }
    [self.tab_list reloadData];
    
}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    

    // Return the number of rows in the section.
   
    
    return _dataArr.count;
    
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   // 复用标志
    static NSString * cellId = @"SEVUnLoginTableViewCell";
    SEVUnLoginTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
// 
    if (cell == nil) {
        cell=[[SEVUnLoginTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    //SEVUnLoginTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"SEVUnLoginTableViewCell"];
    
    
    
     //获取指定的数据
    HeadModels *headModel=_dataArr[indexPath.row];
    
    [cell showDataWithModel:headModel];
    cell.headTitle.text=headModel.headtitle;
    
    
  
    
 
    return cell;
}

- (IBAction)loginBtn:(id)sender {
    
    SEVLoginViewController *sevlogin=[[SEVLoginViewController alloc] init];
    [self.navigationController pushViewController:sevlogin animated:YES];
    
}

- (IBAction)backBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
