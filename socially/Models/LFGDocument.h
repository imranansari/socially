//
//  LFGDocument.h
//  socially
//
//  Created by Imran Ansari on 1/20/14.
//  Copyright (c) 2014 innovativecloudsolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFGDocument : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *description;

- (void) populateWithDict:(NSDictionary*) doc;
@end