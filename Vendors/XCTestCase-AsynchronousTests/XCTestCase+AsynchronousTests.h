//
//  XCTestCase+AsynchronousTests.h
//  AsyncTests
//
//  Created by Christian Sampaio on 10/21/13.
//  Copyright (c) 2013 None. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface XCTestCase (AsynchronousTests)

- (void)startAsyncTest;
- (void)endAsyncTest;
- (void)maximumDelayForAsyncTest:(NSInteger)maxDelay;

@end
