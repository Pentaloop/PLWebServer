//
//  PLWebServer.m
//  Pods
//
//  Created by ladmin on 07/06/2016.
//
//

#import "PLWebServer.h"
#import "PLWebServerHandler.h"

@interface PLWebServer ()

@end


@implementation PLWebServer
@synthesize handlers=_handlers;

@end



@implementation PLWebServer (Handlers)

- (void)addHandlerWithMatchBlock:(PLWebServerMatchBlock)matchBlock processBlock:(PLWebServerProcessBlock)processBlock {
    PLWebServerHandler* handler = [[PLWebServerHandler alloc] initWithMatchBlock:matchBlock processBlock:processBlock];
    if (_handlers == nil) {
        _handlers = [NSMutableArray array];
    }
    [_handlers insertObject:handler atIndex:0];
}

- (void)addDefaultHandlerForMethod:(NSString*)method requestClass:(Class)aClass processBlock:(PLWebServerProcessBlock)block {
    [self addHandlerWithMatchBlock:^PLWebServerRequest *(PLWebServerRequest *request) {
        if (![request.method isEqualToString:method]) {
            return nil;
        }
        
        if (![request isKindOfClass:aClass] ) {
            return [((PLWebServerRequest*)[aClass alloc]) initWithRequest:request];
        }
        
        return request;
        
    } processBlock:block];
}

- (void)addHandlerForMethod:(NSString*)method path:(NSString*)path requestClass:(Class)aClass processBlock:(PLWebServerProcessBlock)block {
    if ([path hasPrefix:@"/"] && [aClass isSubclassOfClass:[PLWebServerRequest class]]) {
        [self addHandlerWithMatchBlock:^PLWebServerRequest *(PLWebServerRequest *request) {
            
            if (![request.method isEqualToString:method]) {
                return nil;
            }
            if ([request.URL.path caseInsensitiveCompare:path] != NSOrderedSame) {
                return nil;
            }
            return [[aClass alloc] initWithRequest:request];
            
        } processBlock:block];
    } else {
        //        GWS_DNOT_REACHED();
    }
}

- (void)addHandlerForMethod:(NSString*)method pathRegex:(NSString*)regex requestClass:(Class)aClass processBlock:(PLWebServerProcessBlock)block {
    NSRegularExpression* expression = [NSRegularExpression regularExpressionWithPattern:regex options:NSRegularExpressionCaseInsensitive error:NULL];
    if (expression && [aClass isSubclassOfClass:[PLWebServerRequest class]]) {
        [self addHandlerWithMatchBlock:^PLWebServerRequest *(PLWebServerRequest *request) {
            
            if (![request.method isEqualToString:method]) {
                return nil;
            }
            
            NSArray* matches = [expression matchesInString:request.URL.path options:0 range:NSMakeRange(0, request.URL.path.length)];
            if (matches.count == 0) {
                return nil;
            }
            
            NSMutableArray* captures = [NSMutableArray array];
            for (NSTextCheckingResult* result in matches) {
                // Start at 1; index 0 is the whole string
                for (NSUInteger i = 1; i < result.numberOfRanges; i++) {
                    NSRange range = [result rangeAtIndex:i];
                    // range is {NSNotFound, 0} "if one of the capture groups did not participate in this particular match"
                    // see discussion in -[NSRegularExpression firstMatchInString:options:range:]
                    if (range.location != NSNotFound) {
                        [captures addObject:[request.URL.path substringWithRange:range]];
                    }
                }
            }
            
            PLWebServerRequest* newRequest = [[aClass alloc] initWithRequest:request];
            //            [request setAttribute:captures forKey:PLWebServerRequestAttribute_RegexCaptures];
            return newRequest;
            
        } processBlock:block];
    } else {
        //        GWS_DNOT_REACHED();
    }
}

@end