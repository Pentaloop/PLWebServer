#import <Foundation/Foundation.h>
#import "PLWebServerResponse.h"


@interface HTTPRedirectResponse : PLWebServerResponse
{
	NSString *redirectPath;
}

- (id)initWithPath:(NSString *)redirectPath;

@end
