//
//  SEVUnLoginTableViewCell.h
//  ShareElectricVehicles
//
//  Created by 张高强 on 2017/4/5.
//  Copyright © 2017年 ZhongHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyModels.h"

@interface SEVUnLoginTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *headTitle;


-(void)showDataWithModel:(HeadModels *)models;


@end
