//
//  IRAppDelegate.h
//  ImageRunner
//
//  Created by John Adams on 4/2/14.
//  Copyright (c) 2014 Retina. All rights reserved.
//

#import <Quartz/Quartz.h> 
#import <AppKit/AppKit.h>
#import <QuartzCore/CAAnimation.h>
#import <QuartzCore/QuartzCore.h>
#import <QuartzCore/CAMediaTiming.h>
#import <QuartzCore/CAMediaTimingFunction.h>

@class IKImageView;

@interface IRAppDelegate : NSObject
{
    IBOutlet IKImageView *mImageView1;
    IBOutlet IKImageView *mImageView2;
    IBOutlet NSWindow *mWindow;
    
    NSDictionary*           _imageProperties1;
    NSString*               _imageUTType1;

    NSDictionary*           _imageProperties2;
    NSString*               _imageUTType2;
}

@end
