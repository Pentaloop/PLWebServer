//
//  PLWebServer.h
//  Pods
//
//  Created by ladmin on 07/06/2016.
//
//

#import "PLWebServerRequest.h"
#import "PLWebServerResponse.h"
#import "PLWebServerCommon.h"
#import "HTTPServer.h"

@interface PLWebServer : HTTPServer
@property(nonatomic, readonly) NSMutableArray* handlers;
@end


@interface PLWebServer (Handlers)

/**
 *  Adds a default handler to the server to handle all incoming HTTP requests
 *  with a given HTTP method and generate responses synchronously.
 */
- (void)addDefaultHandlerForMethod:(NSString*)method requestClass:(Class)aClass processBlock:(PLWebServerProcessBlock)block;

/**
 *  Adds a handler to the server to handle incoming HTTP requests with a given
 *  HTTP method and a specific case-insensitive path  and generate responses
 *  synchronously.
 */
- (void)addHandlerForMethod:(NSString*)method path:(NSString*)path requestClass:(Class)aClass processBlock:(PLWebServerProcessBlock)block;

/**
 *  Adds a handler to the server to handle incoming HTTP requests with a given
 *  HTTP method and a path matching a case-insensitive regular expression and
 *  generate responses synchronously.
 */
- (void)addHandlerForMethod:(NSString*)method pathRegex:(NSString*)regex requestClass:(Class)aClass processBlock:(PLWebServerProcessBlock)block;


@end
