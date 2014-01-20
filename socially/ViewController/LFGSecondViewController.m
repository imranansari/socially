//
//  LFGSecondViewController.m
//  socially
//
//  Created by Imran Ansari on 1/20/14.
//  Copyright (c) 2014 innovativecloudsolutions. All rights reserved.
//
#import "LFGSecondViewController.h"
#import "LFGConstants.h"
#import "LFGUtils.h"

@interface LFGSecondViewController ()

@end

@implementation LFGSecondViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.edgesForExtendedLayout = UIRectEdgeNone;
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(orientationChanged:)
                                               name:UIDeviceOrientationDidChangeNotification
                                             object:nil];
  [LFGUtils setLogoInNavigationController:self.navigationController];
  [LFGUtils fixUIForViewController:self];
}

- (void)viewDidAppear:(BOOL)animated
{
  [LFGUtils showHideLogoForViewController:self];
  [LFGUtils fixUIForViewController:self];
}
- (void)viewWillAppear:(BOOL)animated
{
  [LFGUtils showHideLogoForViewController:self];
  [LFGUtils fixUIForViewController:self];
}

- (void) orientationChanged:(UIInterfaceOrientation) currentOrientation
{
  if(self.navigationController.topViewController == self)
  {
    [LFGUtils showHideLogoForViewController:self];
    [LFGUtils fixUIForViewController:self];
  }
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
  // Return the number of sections.
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
  // Return the number of rows in the section.
  return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
  // Configure the cell...
  cell.textLabel.text = @"Test String.";
  return cell;
}
@end
