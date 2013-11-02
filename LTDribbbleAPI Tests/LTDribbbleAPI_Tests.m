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
    [D shot:1283051 :^(LTShot *shot, NSError *error) {
        XCTAssertNotNil(shot, @"Shot must not be nil!");
        XCTAssertTrue(shot.title && shot.title.length > 0, @"Shot must has a title!");
        XCTAssertNil(error, @"Failed to fetch shot!");
        @kill
    }];
    @wait(MAX_DELAY_FOR_ASYNC_TEST)
}

- (void) testReboundsByShotId
{
    [D rebounds:43424 :^(LTDribbbleResults *results, NSError *error) {
        XCTAssertTrue(results.pagination.pages > 0, @"Results must be at least one page.");
        XCTAssertTrue([(LTShot*)results.items.lastObject title].length > 0, @"The title of the last result must not be empty!");
        XCTAssertNil(error, @"Failed to fetch rebounds!");
        @kill
    }];
    @wait(MAX_DELAY_FOR_ASYNC_TEST)
}

- (void) testPopularShots
{
    [D popularShots:^(LTDribbbleResults *results, NSError *error) {
        XCTAssertTrue(results.pagination.pages > 0, @"Results must be at least one page.");
        XCTAssertTrue([(LTShot*)results.items.lastObject title].length > 0, @"The title of the last result must not be empty!");
        XCTAssertNil(error, @"Failed to fetch rebounds!");
        @kill
    }];
    @wait(MAX_DELAY_FOR_ASYNC_TEST)
}

- (void) testShotsOfFollowing
{
    [D shotsOfFollowing:@"lexrus" :^(LTDribbbleResults *results, NSError *error) {
        XCTAssertTrue(results.pagination.pages > 0, @"Results must be at least one page.");
        XCTAssertTrue([(LTShot*)results.items.lastObject title].length > 0, @"The title of the last result must not be empty!");
        XCTAssertNil(error, @"Failed to fetch rebounds!");
        @kill
    }];
    @wait(MAX_DELAY_FOR_ASYNC_TEST)
}

- (void) testCommentsByShotId
{
    [D comments:1283051 :^(LTDribbbleResults *results, NSError *error) {
        XCTAssertTrue(results.pagination.pages > 0, @"Results must be at least one page.");
        XCTAssertTrue([(LTComment*)results.items.lastObject player].name.length > 0, @"The player of the last comment must has a name!");
        XCTAssertNil(error, @"Failed to fetch comments!");
        @kill
    }];
    @wait(MAX_DELAY_FOR_ASYNC_TEST)
}

- (void) testShotsOfPlayer
{
    [D shotsOfPlayer:@"simplebits" :^(LTDribbbleResults *results, NSError *error) {
        XCTAssertTrue(results.pagination.pages > 0, @"Results must be at least one page.");
        XCTAssertTrue([(LTShot*)results.items.lastObject title].length > 0, @"The title of the last result must not be empty!");
        XCTAssertNil(error, @"Failed to fetch rebounds!");
        @kill
    }];
    @wait(MAX_DELAY_FOR_ASYNC_TEST)
}

- (void) testShotsPlayerLikes
{
    [D shotsPlayerLikes:@"lexrus" :^(LTDribbbleResults *results, NSError *error) {
        XCTAssertTrue(results.pagination.pages > 0, @"Results must be at least one page.");
        XCTAssertTrue([(LTShot*)results.items.lastObject title].length > 0, @"The title of the last result must not be empty!");
        XCTAssertNil(error, @"Failed to fetch rebounds!");
        @kill
    }];
    @wait(MAX_DELAY_FOR_ASYNC_TEST)
}

- (void) testPlayerById
{
    [D player:@"simplebits" :^(LTPlayer *player, NSError *error) {
        XCTAssertTrue(player.username.length > 0, @"Username must not be empty!");
        XCTAssertTrue(player.avatarUrl.length > 0, @"Player must has a avatar!");
        XCTAssertNil(error, @"Failed to fetch rebounds!");
        @kill
    }];
    @wait(MAX_DELAY_FOR_ASYNC_TEST)
}

- (void) testPlayerFollowers
{
    [D playerFollowers:@"simplebits" :^(LTDribbbleResults *results, NSError *error) {
        XCTAssertTrue(results.pagination.pages > 0, @"Results must be at least one page.");
        XCTAssertTrue([(LTPlayer*)results.items.lastObject username].length > 0, @"The username of the last player must not be empty!");
        XCTAssertNil(error, @"Failed to fetch rebounds!");
        @kill
    }];
    @wait(MAX_DELAY_FOR_ASYNC_TEST)
}

@end
