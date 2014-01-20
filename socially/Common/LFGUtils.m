//
//  LFGUtils.m
//  socially
//
//  Created by Imran Ansari on 1/20/14.
//  Copyright (c) 2014 innovativecloudsolutions. All rights reserved.
//

#import "LFGUtils.h"
#import "LFGConstants.h"

@implementation LFGUtils

+ (instancetype)sharedUtils {
  static LFGUtils *_sharedUtils = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedUtils = [[self alloc] init];
  });
  
  return _sharedUtils;
}

//
// Fixing ios7 issue for iPhone in landscape mode, This is the work-around.. need to iterate the issue further
//
+ (void) fixUIForTableViewController:(UITableViewController*) tableViewController
{
  [UIView animateWithDuration:.1 animations:^(){
    CGRect barFrame = viewController.navigationController.navigationBar.frame;
    barFrame.size.height = 44;
    viewController.navigationController.navigationBar.frame = barFrame;
    
    CGRect frame = viewController.view.frame;
    frame.origin.y = 64;
    viewController.view.frame = frame;
    
  }];
}

+ (void) showHideLogoForViewController:(UIViewController*) viewController
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] != UIUserInterfaceIdiomPad && UIDeviceOrientationIsPortrait(viewController.interfaceOrientation))
  {
    [viewController.navigationController.navigationBar viewWithTag:LFGLincolnLogoImageViewTag].hidden = YES;
  }
  else
  {
    [viewController.navigationController.navigationBar viewWithTag:LFGLincolnLogoImageViewTag].hidden = NO;
  }
}

+ (void) setLogoInNavigationController:(UINavigationController*) theNavigationController
{
  UIImage *theImage = [UIImage imageNamed:@"lincoln_logo_white.png"];
  UIImageView *imageView = [[UIImageView alloc] initWithImage:theImage];
  imageView.tag = LFGLincolnLogoImageViewTag;
  [theNavigationController.navigationBar addSubview:imageView];
  CGRect imageViewFrame = imageView.frame;
  imageViewFrame.origin.x += 5;
  imageView.frame = imageViewFrame;
}

@end
