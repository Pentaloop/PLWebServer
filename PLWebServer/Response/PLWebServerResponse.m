#import "PLWebServerResponse.h"

#if ! __has_feature(objc_arc)
#warning This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif


@implementation PLWebServerResponse
{
    CFHTTPMessageRef message;
}

- (id)initRequestWithMethod:(NSString *)method URL:(NSURL *)url version:(NSString *)version
{
    if ((self = [super init]))
    {
        message = CFHTTPMessageCreateRequest(NULL,
                                             (__bridge CFStringRef)method,
                                             (__bridge CFURLRef)url,
                                             (__bridge CFStringRef)version);
    }
    return self;
}

- (id)initResponseWithStatusCode:(NSInteger)code description:(NSString *)description version:(NSString *)version
{
    if ((self = [super init]))
    {
        message = CFHTTPMessageCreateResponse(NULL,
                                              (CFIndex)code,
                                              (__bridge CFStringRef)description,
                                              (__bridge CFStringRef)version);
    }
    return self;
}


- (NSString *)headerField:(NSString *)headerField
{
	return (__bridge_transfer NSString *)CFHTTPMessageCopyHeaderFieldValue(message, (__bridge CFStringRef)headerField);
}

- (void)setHeaderField:(NSString *)headerField value:(NSString *)headerFieldValue
{
	CFHTTPMessageSetHeaderFieldValue(message,
	                                 (__bridge CFStringRef)headerField,
	                                 (__bridge CFStringRef)headerFieldValue);
}

- (NSData *)messageData
{
	return (__bridge_transfer NSData *)CFHTTPMessageCopySerializedMessage(message);
}

@end
