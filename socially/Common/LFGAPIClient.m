#import "LFGAPIClient.h"
#import "AFJSONRequestOperation.h"

static NSString * const LFGAPIBaseURLString = @"http://localhost";

@implementation LFGAPIClient

+ (instancetype)sharedClient {
  static LFGAPIClient *_sharedClient = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:LFGAPIBaseURLString]];
  });
  
  return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
  self = [super initWithBaseURL:url];
  if (!self) {
    return nil;
  }
  
  [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
  [self setDefaultHeader:@"Accept" value:@"application/json"];
  
  return self;
}
@end
