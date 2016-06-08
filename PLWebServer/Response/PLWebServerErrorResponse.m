
#import "PLWebServerErrorResponse.h"

@implementation PLWebServerErrorResponse
{
    NSInteger _responseCode;
}

- (id)initWithResponseCode:(NSInteger)responseCode
{
    if ((self = [super init])) {
        HTTPLogTrace();
        _responseCode = responseCode;
    }
    return self;
}

- (UInt64)contentLength {
    return 0;
}

- (UInt64)offset {
    return 0;
}

- (void)setOffset:(UInt64)offset {
    // Nothing to do
}

- (NSData *)readDataOfLength:(NSUInteger)length {
    return nil;
}

- (BOOL)isDone {
    return YES;
}


- (NSInteger)status {
    return _responseCode;
}



@end
