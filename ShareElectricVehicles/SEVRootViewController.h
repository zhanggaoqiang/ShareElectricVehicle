//
//  SEVRootViewController.h
//  ShareElectricVehicles
//
//  Created by 张高强 on 2017/4/5.
//  Copyright © 2017年 ZhongHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>


@interface SEVRootViewController : UIViewController<BMKMapViewDelegate,BMKLocationServiceDelegate>
{
  

    IBOutlet BMKMapView *_mapView;
    BMKLocationService* _locService;
    
}


@end
