#import "PLWebServerResponse.h"

#if ! __has_feature(objc_arc)
#warning This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif


@implementation PLWebServerResponse
{
    NSMutableDictionary* _headers;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        _headers = [NSMutableDictionary dictionary];
        self.statusCode = kPLWebServerHTTPStatusCode_OK;
        self.httpVersion = (NSString *)kCFHTTPVersion1_1;
    }
    return self;
}



- (id)initWithStatusCode:(NSInteger)code
{
    if ((self = [self init]))
    {
        self.statusCode = code;
    }
    return self;
}


- (NSData *)messageData
{
    // Set headers into message
    NSString* description = nil;
    CFHTTPMessageRef message = CFHTTPMessageCreateResponse(NULL,
                                                           self.statusCode,
                                                           (__bridge CFStringRef)description,
                                                           (__bridge CFStringRef)self.httpVersion);
    for (NSString* key in _headers.allKeys) {
        CFHTTPMessageSetHeaderFieldValue(message,
                                         (__bridge CFStringRef)key,
                                         (__bridge CFStringRef)_headers[key]);
    }
    
    if (self.body) {
        CFHTTPMessageSetBody(message, (__bridge CFDataRef)self.body);
    }
	return (__bridge_transfer NSData *)CFHTTPMessageCopySerializedMessage(message);
}

-(NSMutableDictionary*)headers
{
    _headers;
}

@end
