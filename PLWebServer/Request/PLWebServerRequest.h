/**
 * The PLWebServerRequest class is a simple Objective-C wrapper around Apple's CFPLWebServerRequest class.
**/

#import <Foundation/Foundation.h>

#define HTTPVersion1_0  ((NSString *)kCFHTTPVersion1_0)
#define HTTPVersion1_1  ((NSString *)kCFHTTPVersion1_1)


@interface PLWebServerRequest : NSObject

- (id)initWithRequest:(PLWebServerRequest*)request;

/**
 *  Returns the HTTP method for the request.
 */
@property(nonatomic, readonly) NSString* method;

/**
 *  Returns the URL for the request.
 */
@property(nonatomic, readonly) NSURL* URL;

/**
 *  Returns the HTTP headers for the request.
 */
@property(nonatomic, readonly) NSDictionary* headers;

/**
 *  Returns the HTTP version for the request.
 */
@property(nonatomic, readonly) NSString* version;

/**
 *  Returns the Status Code for the request.
 */
@property(atomic, readonly) NSInteger statusCode;

/**
 *  Indicate whether we have enough data appended to parse HTTP header part.
 */
@property(atomic, readonly) BOOL isHeaderComplete;

/**
 *  HTTP request body as NSData.
 */
@property(nonatomic) NSData* body;


- (BOOL)appendData:(NSData *)data;

@end
