//
//  LFGUtils.h
//  socially
//
//  Created by Imran Ansari on 1/20/14.
//  Copyright (c) 2014 innovativecloudsolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFGUtils : NSObject

+ (instancetype)sharedUtils;

+ (void) fixUIForTableViewController:(UITableViewController*) tableViewController;
+ (void) showHideLogoForViewController:(UIViewController*) viewController;
+ (void) setLogoInNavigationController:(UINavigationController*) theNavigationController;
@end
