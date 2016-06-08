#import <Foundation/Foundation.h>
#import "PLWebServerResponse.h"

@class HTTPConnection;


@interface HTTPFileResponse : PLWebServerResponse
{
	HTTPConnection *connection;
	
	NSString *filePath;
	UInt64 fileLength;
	UInt64 fileOffset;
	
	BOOL aborted;
	
	int fileFD;
	void *buffer;
	NSUInteger bufferSize;
}

- (id)initWithFilePath:(NSString *)filePath forConnection:(HTTPConnection *)connection;
- (NSString *)filePath;

@end
