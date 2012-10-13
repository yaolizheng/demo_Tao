//
//  demoCaptureSessionManager.h
//  demo
//
//  Created by Tao Zong on 10/11/12.
//  Copyright (c) 2012 Tao Zong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface demoCaptureSessionManager : NSObject

@property (strong) AVCaptureVideoPreviewLayer *previewLayer;
@property (strong) AVCaptureSession *captureSession;

- (void)addVideoPreviewLayer;
- (void)addVideoInput;

@end
