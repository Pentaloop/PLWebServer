//
//  PLWebServerStringResponse.m
//  Pods
//
//  Created by ladmin on 08/06/2016.
//
//

#import "PLWebServerStringResponse.h"

@implementation PLWebServerStringResponse

-(id)initWithString:(NSString*)str
{
    NSData* data = nil;
    if (str) {
        data = [str dataUsingEncoding:NSUTF8StringEncoding];
        if (data == nil) {
            return nil;
        }
    }
    return [self initWithData:data];
}

@end
