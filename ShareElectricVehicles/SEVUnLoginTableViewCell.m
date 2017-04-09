//
//  SEVUnLoginTableViewCell.m
//  ShareElectricVehicles
//
//  Created by 张高强 on 2017/4/5.
//  Copyright © 2017年 ZhongHao. All rights reserved.
//

#import "SEVUnLoginTableViewCell.h"

@implementation SEVUnLoginTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



-(void)showDataWithModel:(HeadModels *)models {
    
    self.headTitle.text=models.headtitle;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
