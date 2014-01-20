//
//  LFGDocument.m
//  socially
//
//  Created by Imran Ansari on 1/20/14.
//  Copyright (c) 2014 innovativecloudsolutions. All rights reserved.
//

#import "LFGDocument.h"

@implementation LFGDocument

- (void) populateWithDict:(NSDictionary*) doc
{
  self.title = [doc objectForKey:@"Title"];
  self.description = [doc objectForKey:@"desc"];
}

@end
