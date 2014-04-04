//
//  IRAppDelegate.m
//  ImageRunner
//
//  Created by John Adams on 4/2/14.
//  Copyright (c) 2014 Retina. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

#import "IRAppDelegate.h"

#define ZOOM_IN_FACTOR  1.414214
#define ZOOM_OUT_FACTOR 0.7071068

@implementation IRAppDelegate


// ---------------------------------------------------------------------------------------------------------------------
- (void)openImageURL1: (NSURL*)url
{
    // use ImageIO to get the CGImage, image properties, and the image-UTType
    //
    CGImageRef          image = NULL;
    CGImageSourceRef    isr = CGImageSourceCreateWithURL( (__bridge CFURLRef)url, NULL);
    
    if (isr)
    {
		NSDictionary *options = [NSDictionary dictionaryWithObject: (id)kCFBooleanTrue  forKey: (id) kCGImageSourceShouldCache];
        image = CGImageSourceCreateImageAtIndex(isr, 0, (__bridge CFDictionaryRef)options);
        
        if (image)
        {
            _imageProperties1 = (NSDictionary*)CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(isr, 0, (__bridge CFDictionaryRef)_imageProperties1));
            
            _imageUTType1 = (__bridge NSString*)CGImageSourceGetType(isr);
        }
		CFRelease(isr);
        
    }
    
    if (image)
    {
        [mImageView1 setImage: image
             imageProperties: _imageProperties];
		
		CGImageRelease(image);
        
     //   [mWindow setTitleWithRepresentedFilename: [url path]];
    }
}

- (void)openImageURL2: (NSURL*)url
{
    // use ImageIO to get the CGImage, image properties, and the image-UTType
    //
    CGImageRef          image = NULL;
    CGImageSourceRef    isr = CGImageSourceCreateWithURL( (__bridge CFURLRef)url, NULL);
    
    if (isr)
    {
		NSDictionary *options = [NSDictionary dictionaryWithObject: (id)kCFBooleanTrue  forKey: (id) kCGImageSourceShouldCache];
        image = CGImageSourceCreateImageAtIndex(isr, 0, (__bridge CFDictionaryRef)options);
        
        if (image)
        {
            _imageProperties = (NSDictionary*)CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(isr, 0, (__bridge CFDictionaryRef)_imageProperties));
            
            _imageUTType = (__bridge NSString*)CGImageSourceGetType(isr);
        }
		CFRelease(isr);
        
    }
    
    if (image)
    {
        [mImageView2 setImage: image
             imageProperties: _imageProperties];
		
		CGImageRelease(image);
        
        //   [mWindow setTitleWithRepresentedFilename: [url path]];
    }
}



// ---------------------------------------------------------------------------------------------------------------------
- (void)windowDidResize:(NSNotification *)notification
{
    // whenever the window gets resized - do a zoom-to-fit
    
    [CATransaction begin];
    [CATransaction setValue: [NSNumber numberWithFloat: 0]
                     forKey: kCATransactionAnimationDuration];
    [mImageView1 zoomImageToFit: self];
    [mImageView2 zoomImageToFit: self];

    [CATransaction commit];
    [mImageView1 zoomImageToFit: self];
    [mImageView2 zoomImageToFit: self];
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application

    // Insert code here to initialize your application
    NSString *filePath1 =
    [[NSBundle mainBundle] pathForResource:@"A" ofType:@"jpg"];
    NSURL *fileNameAndPath1 = [NSURL fileURLWithPath:filePath1];
    
    NSString *filePath2 =
    [[NSBundle mainBundle] pathForResource:@"B" ofType:@"jpg"];
    NSURL *fileNameAndPath2 = [NSURL fileURLWithPath:filePath2];
    
    [self openImageURL1:fileNameAndPath1];
    [mImageView1 zoomImageToFit: self];
    
    [self openImageURL2:fileNameAndPath2];
    [mImageView2 zoomImageToFit: self];

    // well this works.    [mImageView enterFullScreenMode:[NSScreen mainScreen] withOptions:[NSDictionary dictionaryWithObjectsAndKeys:nil]];


}
@end


