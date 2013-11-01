//
//  XCTestCase+AsynchronousTests.m
//  AsyncTests
//
//  Created by Christian Sampaio on 10/21/13.
//  Copyright (c) 2013 None. All rights reserved.
//

#import "XCTestCase+AsynchronousTests.h"

static BOOL hasEntered;

@implementation XCTestCase (AsynchronousTests)

- (void) startAsyncTest
{
    hasEntered = NO;
}

- (void) endAsyncTest
{
    hasEntered = YES;
}

- (void)maximumDelayForAsyncTest:(NSInteger)maxDelay
{
    NSDate *loopUntil = [NSDate dateWithTimeIntervalSinceNow:maxDelay];
    while (hasEntered == NO && [loopUntil timeIntervalSinceNow] > 0) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:loopUntil];
    }
    
    if (hasEntered != YES) {
        XCTFail(@"Return of async call never reached");
    }
}

@end
