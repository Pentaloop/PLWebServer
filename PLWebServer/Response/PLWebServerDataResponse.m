#import "PLWebServerDataResponse.h"
#import "HTTPLogging.h"

// Log levels : off, error, warn, info, verbose
// Other flags: trace
static const int httpLogLevel = HTTP_LOG_LEVEL_OFF; // | HTTP_LOG_FLAG_TRACE;


@implementation PLWebServerDataResponse
{
    NSUInteger _offset;
    NSData *data;
}


- (id)initWithData:(NSData *)dataParam
{
	if((self = [super init]))
	{
		HTTPLogTrace();
		
		_offset = 0;
		data = dataParam;
	}
	return self;
}

- (void)dealloc
{
	HTTPLogTrace();
	
}

- (UInt64)contentLength
{
	UInt64 result = (UInt64)[data length];
	
	HTTPLogTrace2(@"%@[%p]: contentLength - %llu", THIS_FILE, self, result);
	
	return result;
}

- (UInt64)offset
{
	HTTPLogTrace();
	
	return _offset;
}

- (void)setOffset:(UInt64)offsetParam
{
	HTTPLogTrace2(@"%@[%p]: setOffset:%lu", THIS_FILE, self, (unsigned long)offset);
	
	_offset = (NSUInteger)offsetParam;
}

- (NSData *)readDataOfLength:(NSUInteger)lengthParameter
{
	HTTPLogTrace2(@"%@[%p]: readDataOfLength:%lu", THIS_FILE, self, (unsigned long)lengthParameter);
	
	NSUInteger remaining = [data length] - _offset;
	NSUInteger length = lengthParameter < remaining ? lengthParameter : remaining;
	
	void *bytes = (void *)([data bytes] + _offset);
	
	_offset += length;
	
	return [NSData dataWithBytesNoCopy:bytes length:length freeWhenDone:NO];
}

- (BOOL)isDone
{
	BOOL result = (_offset == [data length]);
	
	HTTPLogTrace2(@"%@[%p]: isDone - %@", THIS_FILE, self, (result ? @"YES" : @"NO"));
	
	return result;
}

@end
