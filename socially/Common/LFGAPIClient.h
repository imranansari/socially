#import "AFHTTPClient.h"

@interface LFGAPIClient : AFHTTPClient

+ (LFGAPIClient *)sharedClient;
@end
