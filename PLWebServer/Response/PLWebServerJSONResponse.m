//
//  PLWebServeJsonResponse.m
//  Pods
//
//  Created by ladmin on 08/06/2016.
//
//

#import "PLWebServerJSONResponse.h"

@implementation PLWebServerJSONResponse

-(id)initWithJSONObject:(id)obj
{
    NSData* data = nil;
    if (obj) {
        data = [NSJSONSerialization dataWithJSONObject:obj options:0 error:NULL];
        if (data == nil) {
            return nil;
        }
    }
    return [self initWithData:data];
}

@end
