//
//  demoViewController.m
//  demo
//
//  Created by Tao Zong on 10/10/12.
//  Copyright (c) 2012 Tao Zong. All rights reserved.
//

#import "demoViewController.h"

@interface demoViewController ()

@end

@implementation demoViewController

@synthesize captureManager;
@synthesize locationManager;
@synthesize headingLabel;

#define degrees(x) (180 * x / M_PI)

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setCaptureManager:[[demoCaptureSessionManager alloc] init]];    
	[[self captureManager] addVideoInput];    
	[[self captureManager] addVideoPreviewLayer];
	CGRect layerRect = [[[self view] layer] bounds];
	[[[self captureManager] previewLayer] setBounds:layerRect];
	[[[self captureManager] previewLayer] setPosition:CGPointMake(CGRectGetMidX(layerRect),
                                                                  CGRectGetMidY(layerRect))];
	[[[self view] layer] addSublayer:[[self captureManager] previewLayer]];
	[[captureManager captureSession] startRunning];
    
    headingLabel = [[UILabel alloc] initWithFrame: CGRectMake(100, 250, 150, 30)];
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = 100;
    locationManager.headingFilter = 1;
    [locationManager startUpdatingLocation];
    [locationManager startUpdatingHeading];
    
}

- (void)locationManager:(CLLocationManager *) manager didUpdateHeading:(CLHeading *) newHeading {
    if (newHeading.headingAccuracy > 0) {
        CLLocationDirection theHeading = newHeading.trueHeading;
        NSString *head = [NSString stringWithFormat:@"heading: %i", (int)theHeading];
        [headingLabel setText:head];
        [headingLabel setTextColor:[UIColor orangeColor]];
        [headingLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin];
        
        [[self view] addSubview: headingLabel];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if(interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        [[self captureManager] previewLayer].orientation = UIInterfaceOrientationLandscapeLeft;
    }
    if(interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        [[self captureManager] previewLayer].orientation = UIInterfaceOrientationLandscapeRight;
    }
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
    
}

@end
