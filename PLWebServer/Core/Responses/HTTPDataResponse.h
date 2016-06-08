#import <Foundation/Foundation.h>
#import "PLWebServerResponse.h"


@interface HTTPDataResponse : PLWebServerResponse
{
	NSUInteger offset;
	NSData *data;
}

- (id)initWithData:(NSData *)data;

@end
