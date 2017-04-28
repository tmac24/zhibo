//
//  STLocationManager.m
//  zhibo
//
//  Created by 孙涛 on 2017/4/27.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import "STLocationManager.h"
#import <CoreLocation/CoreLocation.h>

@interface STLocationManager ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager * locManager;

@property (nonatomic, copy) LocationBlock block;
@end

@implementation STLocationManager


+ (instancetype)sharedManager {
    
    static STLocationManager * _manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[STLocationManager alloc] init];
    });
    
    return _manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _locManager = [[CLLocationManager alloc] init];
        [_locManager setDesiredAccuracy:kCLLocationAccuracyBest];
        _locManager.distanceFilter = 100;
        _locManager.delegate = self;
        
        if (![CLLocationManager locationServicesEnabled]) {
            NSLog(@"开启定位服务");
        } else {
            //kCLAuthorizationStatusAuthorizedWhenInUse
            //kCLAuthorizationStatusNotDetermined
            CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
            if (status == kCLAuthorizationStatusNotDetermined) {
                [_locManager requestWhenInUseAuthorization];
            } else if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
                //设置精确度
                _locManager.desiredAccuracy = kCLLocationAccuracyBest;
                //每十米定位一次
                CLLocationDistance distance = 10.0;
                _locManager.distanceFilter = distance;
                //启动跟踪定位
                [_locManager startUpdatingLocation];
            }
        }
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    
    CLLocationCoordinate2D coor = newLocation.coordinate;
    
    NSString * lat = [NSString stringWithFormat:@"%@",@(coor.latitude)];
    NSString * lon = [NSString stringWithFormat:@"%@",@(coor.longitude)];
    
    [STLocationManager sharedManager].lat = lat;
    [STLocationManager sharedManager].lon = lon;
    
    self.block(lat,lon);
    
    [self.locManager stopUpdatingLocation];
    
}



- (void)getGps:(LocationBlock)block {
    
    self.block = block;
    [self.locManager startUpdatingLocation];
    
}



@end
