//
//  LFGDetailViewController.m
//  socially
//
//  Created by Imran Ansari on 1/20/14.
//  Copyright (c) 2014 innovativecloudsolutions. All rights reserved.
//

#import "LFGDetailViewController.h"
#import "LFGConstants.h"
#import "LFGUtils.h"

@interface LFGDetailViewController ()

@end

@implementation LFGDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.edgesForExtendedLayout = UIRectEdgeNone;
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(orientationChanged:)
                                               name:UIDeviceOrientationDidChangeNotification
                                             object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
  [LFGUtils fixUIForViewController:self];
}
- (void)viewWillAppear:(BOOL)animated
{
  self.edgesForExtendedLayout = UIRectEdgeNone;
  [self.navigationController.navigationBar viewWithTag:LFGLincolnLogoImageViewTag].hidden = YES;
  [LFGUtils fixUIForViewController:self];
}

- (void) orientationChanged:(UIInterfaceOrientation) currentOrientation
{
  [LFGUtils fixUIForViewController:self];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end