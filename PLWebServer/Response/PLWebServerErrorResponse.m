
#import "PLWebServerErrorResponse.h"

@implementation PLWebServerErrorResponse
- (id)initWithResponseCode:(NSInteger)responseCode
{
    if ((self = [super init])) {
        HTTPLogTrace();
        self.statusCode = responseCode;
    }
    return self;
}

@end
