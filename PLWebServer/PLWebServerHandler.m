//
//  PLWebServerHandler.m
//  Pods
//
//  Created by ladmin on 08/06/2016.
//
//

#import "PLWebServerHandler.h"

@implementation PLWebServerHandler

@synthesize matchBlock=_matchBlock, processBlock=_processBlock;

- (id)initWithMatchBlock:(PLWebServerMatchBlock)matchBlock processBlock:(PLWebServerProcessBlock)processBlock {
    if ((self = [super init])) {
        _matchBlock = [matchBlock copy];
        _processBlock = [processBlock copy];
    }
    return self;
}

@end