//
//  PLWebServerHandler.h
//  Pods
//
//  Created by ladmin on 08/06/2016.
//
//

#import <Foundation/Foundation.h>
#import "PLWebServerCommon.h"


@interface PLWebServerHandler : NSObject
@property(nonatomic, readonly) PLWebServerMatchBlock matchBlock;
@property(nonatomic, readonly) PLWebServerProcessBlock processBlock;
- (id)initWithMatchBlock:(PLWebServerMatchBlock)matchBlock processBlock:(PLWebServerProcessBlock)processBlock;
@end