//
//  LTDribbbleAPI_Tests.m
//  LTDribbbleAPI Tests
//
//  Created by Lex on 11/1/13.
//  Copyright (c) 2013 Lex Tang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XCTestCase+AsynchronousTests.h"
#import "LTDribbbleAPI.h"

#define wait(...) try {}@finally{}[self startAsyncTest]; [self maximumDelayForAsyncTest:__VA_ARGS__];
#define kill                     try {}@finally{}[self endAsyncTest];

#define MAX_DELAY_FOR_ASYNC_TEST 7

#define D [LTDribbbleAPI shared]

@interface LTDribbbleAPI_Tests : XCTestCase

@end

@implementation LTDribbbleAPI_Tests

- (void) setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void) tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testShotById
{
    [D shotById:1283051 :^(LTShot *shot, NSError *error) {
        XCTAssertNotNil(shot, @"Shot must not be nil!");
        XCTAssertTrue(shot.title && shot.title.length > 0, @"Shot must has a title!");
        XCTAssertNil(error, @"Failed to fetch shot!");
        @kill
    }];
    @wait(5)
}

@end
