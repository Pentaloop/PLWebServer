//
//  PLWebServerCommon.h
//  Pods
//
//  Created by ladmin on 08/06/2016.
//
//

#ifndef PLWebServerCommon_h
#define PLWebServerCommon_h

#import "PLWebServerRequest.h"
#import "PLWebServerResponse.h"

typedef PLWebServerRequest* (^PLWebServerMatchBlock)(PLWebServerRequest* request);
typedef PLWebServerResponse* (^PLWebServerProcessBlock)(__kindof PLWebServerRequest* request);

typedef void (^PLWebServerCompletionBlock)(PLWebServerResponse* response);
typedef void (^PLWebServerAsyncProcessBlock)(__kindof PLWebServerRequest* request, PLWebServerCompletionBlock completionBlock);

#endif /* PLWebServerCommon_h */
