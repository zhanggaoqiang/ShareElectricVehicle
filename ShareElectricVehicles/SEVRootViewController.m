//
//  SEVRootViewController.m
//  ShareElectricVehicles
//
//  Created by 张高强 on 2017/4/5.
//  Copyright © 2017年 ZhongHao. All rights reserved.
//

#import "SEVRootViewController.h"
#import "SEVUnLoginViewController.h"

@interface SEVRootViewController ()

@end

@implementation SEVRootViewController




-(void)viewWillAppear:(BOOL)animated {
    
    [_mapView viewWillAppear];
    _mapView.delegate=self;
    _locService.delegate=self;
    
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
}



/**
 *在地图View将要启动定位时，会调用此函数
 */
- (void)willStartLocatingUser
{
    NSLog(@"start locate");
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [_mapView updateLocationData:userLocation];
    
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    //    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    [_mapView updateLocationData:userLocation];
    _mapView.centerCoordinate=userLocation.location.coordinate;
}

/**
 *在地图View停止定位后，会调用此函数

 */
- (void)didStopLocatingUser
{
    NSLog(@"stop locate");
}

/**
 *定位失败后，会调用此函数

 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
}


- (void)dealloc {
    if (_mapView) {
        _mapView = nil;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    
     _locService = [[BMKLocationService alloc]init];
    
    
    NSLog(@"进入普通定位态");
    [_locService startUserLocationService];
    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态
    _mapView.showsUserLocation = YES;//显示定位图层
    _mapView.zoomLevel=18;
    

    
    
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)pushLogin:(id)sender {
    SEVUnLoginViewController *unlogin=[[SEVUnLoginViewController alloc] init];
    [self.navigationController pushViewController:unlogin animated:YES];
    
    
    
    
}

- (IBAction)unloginUseDescriptionBtn:(id)sender {
    SEVUnLoginViewController *unlogin=[[SEVUnLoginViewController alloc] init];
    [self.navigationController pushViewController:unlogin animated:YES];

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
