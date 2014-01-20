//
//  LFGFirstViewController.m
//  socially
//
//  Created by Imran Ansari on 1/20/14.
//  Copyright (c) 2014 innovativecloudsolutions. All rights reserved.
//

#import "LFGFirstViewController.h"
#import "LFGConstants.h"
#import "LFGUtils.h"
#import "LFGAPIClient.h"
#import "LFGDocument.h"
#import "AFJSONRequestOperation.h"

#define TableViewCellMainLabelTag 123
#define TableViewCellDetailLabelTag 124

@interface LFGFirstViewController ()


@end
@implementation LFGFirstViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
  self = [super initWithCoder:aDecoder];
  if (self) {
    _docList = [[NSMutableArray alloc] init];
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
  [LFGUtils setLogoInNavigationController:self.navigationController];
  [LFGUtils fixUIForViewController:self];
  [self fetchDocumentDetails];
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
}

#pragma Mark - Common

- (void) fetchDocumentDetails
{
  LFGAPIClient* client = [LFGAPIClient sharedClient];
  
  NSURLRequest* request = [client requestWithMethod:@"GET" path:LFGJSONFilePath parameters:nil];
  // Creating JSON request operation
  AFJSONRequestOperation* operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSArray *JSON)
                                       {
                                         [self populateDocumentList:_docList withDictList:JSON];
                                         [self.tableView reloadData];
                                       }
                                       failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON)
                                       {
                                         NSLog(@"%@", [error localizedDescription]);
                                       }];
  // Start the request
  [operation start];
}

- (void) populateDocumentList:(NSMutableArray*) docList withDictList:(NSArray*) dictList
{
  for (NSDictionary *dict in dictList)
  {
    LFGDocument *document = [[LFGDocument alloc] init];
    [document populateWithDict:dict];
    [docList addObject:document];
  }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [_docList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
  LFGDocument *doc = [_docList objectAtIndex:indexPath.row];
  
  UILabel *mainLabel = (UILabel *)[cell viewWithTag:TableViewCellMainLabelTag];
  mainLabel.text = doc.title;
  
  UILabel *detailLabel = (UILabel *)[cell viewWithTag:TableViewCellDetailLabelTag];
  detailLabel.text = doc.description;
  return cell;
}
@end
