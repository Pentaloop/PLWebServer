#import "PLWebServerRequest.h"



@implementation PLWebServerRequest
{
    CFHTTPMessageRef message;
}

- (id)initWithRequest:(PLWebServerRequest*)request
{
    if ((self = [super init]))
    {
        message =  CFHTTPMessageCreateCopy(NULL, request->message);
    }
    return self;
}

- (id)init
{
	if ((self = [super init]))
	{
		message = CFHTTPMessageCreateEmpty(NULL, YES);
	}
	return self;
}




- (void)dealloc
{
	if (message)
	{
		CFRelease(message);
	}
}

- (BOOL)appendData:(NSData *)data
{
	return CFHTTPMessageAppendBytes(message, [data bytes], [data length]);
}

- (BOOL)isHeaderComplete
{
	return CFHTTPMessageIsHeaderComplete(message);
}

- (NSString *)version
{
	return (__bridge_transfer NSString *)CFHTTPMessageCopyVersion(message);
}

- (NSString *)method
{
	return (__bridge_transfer NSString *)CFHTTPMessageCopyRequestMethod(message);
}

- (NSURL *)url
{
	return (__bridge_transfer NSURL *)CFHTTPMessageCopyRequestURL(message);
}

- (NSInteger)statusCode
{
	return (NSInteger)CFHTTPMessageGetResponseStatusCode(message);
}

- (NSDictionary *)headers
{
	return (__bridge_transfer NSDictionary *)CFHTTPMessageCopyAllHeaderFields(message);
}

//- (NSString *)headerField:(NSString *)headerField
//{
//	return (__bridge_transfer NSString *)CFHTTPMessageCopyHeaderFieldValue(message, (__bridge CFStringRef)headerField);
//}
//
//- (void)setHeaderField:(NSString *)headerField value:(NSString *)headerFieldValue
//{
//	CFHTTPMessageSetHeaderFieldValue(message,
//	                                 (__bridge CFStringRef)headerField,
//	                                 (__bridge CFStringRef)headerFieldValue);
//}

//- (NSData *)messageData
//{
//	return (__bridge_transfer NSData *)CFHTTPMessageCopySerializedMessage(message);
//}

- (NSData *)body
{
	return (__bridge_transfer NSData *)CFHTTPMessageCopyBody(message);
}

- (void)setBody:(NSData *)body
{
	CFHTTPMessageSetBody(message, (__bridge CFDataRef)body);
}

@end
