//
//  demoViewController.h
//  demo
//
//  Created by Tao Zong on 10/10/12.
//  Copyright (c) 2012 Tao Zong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import <CoreLocation/CoreLocation.h>
#import "demoCaptureSessionManager.h"

@interface demoViewController : UIViewController

@property (strong) demoCaptureSessionManager *captureManager;
@property (retain, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) IBOutlet UILabel *headingLabel;

@end
