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

#define wait(...) try{}@finally{} [self startAsyncTest]; [self maximumDelayForAsyncTest:__VA_ARGS__];
#define kill      try{}@finally{} [self endAsyncTest];

#define TEST_TIMEOUT 15

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
    [D shot:1283051 :^(LTDribbbleShot *shot, NSError *error) {
        XCTAssertNotNil(shot, @"Shot must not be nil!");
        XCTAssertTrue(shot.title && shot.title.length > 0, @"Shot must has a title!");
        XCTAssertNil(error, @"Failed to fetch shot!");
        @kill
    }];
    @wait(TEST_TIMEOUT)
}

- (void) testReboundsByShotId
{
    [D rebounds:43424 page:1 :^(LTDribbbleResults *results, NSError *error) {
        XCTAssertTrue(results.pagination.pages > 0, @"Results must be at least one page.");
        XCTAssertTrue([(LTDribbbleShot *)results.items.lastObject title].length > 0, @"The title of the last result must not be empty!");
        XCTAssertNil(error, @"Failed to fetch rebounds!");
        @kill
    }];
    @wait(TEST_TIMEOUT)
}

- (void) testPopularShots
{
    [D popularShots:1 :^(LTDribbbleResults *results, NSError *error) {
        XCTAssertTrue(results.pagination.perPage == 30, @"Results must be 30 shots per page.");
        XCTAssertTrue(results.pagination.pages > 0, @"Results must be at least one page.");
        XCTAssertTrue([(LTDribbbleShot *)results.items.lastObject title].length > 0, @"The title of the last result must not be empty!");
        XCTAssertNil(error, @"Failed to fetch rebounds!");
        @kill
    }];
    @wait(TEST_TIMEOUT)
}

- (void) testShotsOfFollowing
{
    [D shotsOfFollowing:@"lexrus" page:1 :^(LTDribbbleResults *results, NSError *error) {
        XCTAssertTrue(results.pagination.pages > 0, @"Results must be at least one page.");
        XCTAssertTrue([(LTDribbbleShot *)results.items.lastObject title].length > 0, @"The title of the last result must not be empty!");
        XCTAssertNil(error, @"Failed to fetch rebounds!");
        @kill
    }];
    @wait(TEST_TIMEOUT)
}

- (void) testCommentsByShotId
{
    [D comments:1283051 page:1 :^(LTDribbbleResults *results, NSError *error) {
        XCTAssertTrue(results.pagination.pages > 0, @"Results must be at least one page.");
        XCTAssertTrue([(LTDribbbleComment*)results.items.lastObject player].name.length > 0, @"The player of the last comment must has a name!");
        XCTAssertNil(error, @"Failed to fetch comments!");
        @kill
    }];
    @wait(TEST_TIMEOUT)
}

- (void) testShotsOfPlayer
{
    [D shotsOfPlayer:@"simplebits" page:1 :^(LTDribbbleResults *results, NSError *error) {
        XCTAssertTrue(results.pagination.pages > 0, @"Results must be at least one page.");
        XCTAssertTrue([(LTDribbbleShot *)results.items.lastObject title].length > 0, @"The title of the last result must not be empty!");
        XCTAssertNil(error, @"Failed to fetch rebounds!");
        @kill
    }];
    @wait(TEST_TIMEOUT)
}

- (void) testShotsPlayerLikes
{
    [D shotsPlayerLikes:@"lexrus" page:1 :^(LTDribbbleResults *results, NSError *error) {
        XCTAssertTrue(results.pagination.pages > 0, @"Results must be at least one page.");
        XCTAssertTrue([(LTDribbbleShot *)results.items.lastObject title].length > 0, @"The title of the last result must not be empty!");
        XCTAssertNil(error, @"Failed to fetch rebounds!");
        @kill
    }];
    @wait(TEST_TIMEOUT)
}

- (void) testPlayerById
{
    [D player:@"simplebits" :^(LTDribbblePlayer *player, NSError *error) {
        XCTAssertTrue(player.username.length > 0, @"Username must not be empty!");
        XCTAssertTrue(player.avatarUrl.length > 0, @"Player must has a avatar!");
        XCTAssertNil(error, @"Failed to fetch rebounds!");
        @kill
    }];
    @wait(TEST_TIMEOUT)
}

- (void) testPlayerFollowers
{
    [D playerFollowers:@"simplebits" page:1 :^(LTDribbbleResults *results, NSError *error) {
        XCTAssertTrue(results.pagination.pages > 0, @"Results must be at least one page.");
        XCTAssertTrue([(LTDribbblePlayer *)results.items.lastObject username].length > 0, @"The username of the last player must not be empty!");
        XCTAssertNil(error, @"Failed to fetch rebounds!");
        @kill
    }];
    @wait(TEST_TIMEOUT)
}

@end
