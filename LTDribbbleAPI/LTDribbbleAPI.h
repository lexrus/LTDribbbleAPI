//
//  LTDribbbleAPI.h
//  LTDribbbleAPI
//
//  Created by Lex on 11/1/13.
//  Copyright (c) 2013 Lex Tang. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"
#import "LTDribbblePagination.h"
#import "LTDribbbleResults.h"
#import "LTDribbbleDataModels.h"

FOUNDATION_EXPORT NSString *const DRIBBBLE_API;

#define rShotById @"/shots/%i"
#define rShotRebounds @"/shots/%i/rebounds"
#define rDebutsShots @"/shots/debuts"
#define rEveryoneShots @"/shots/everyone"
#define rPopularShots @"/shots/popular"
#define rFollowingShots @"/players/%@/shots/following"
#define rShotComments @"/shots/%i/comments"
#define rPlayerShots @"/players/%@/shots"
#define rPlayerLikes @"/players/%@/shots/likes"
#define rPlayerById @"/players/%@"
#define rPlayerFollowers @"/players/%@/followers"
#define rPlayerFollowing @"/players/%@/following"
#define rPlayerDraftees @"/players/%@/draftees"

typedef void (^LTResultBlock)(id result, NSError *error);
typedef void (^LTResultsBlock)(LTDribbbleResults *results, NSError *error);

@interface LTDribbbleAPI : AFHTTPRequestOperationManager

+ (LTDribbbleAPI *) shared;

@property (assign, nonatomic) NSInteger perPage;

/**
 *  Returns details for a shot specified by :aShotId.
 */
- (void)shot:(uint)aShotId :(LTResultBlock)resultBlock;

/**
 *  Returns the set of rebounds (shots in response to a shot) for the shot specified by :aShotId.
 */
- (void)rebounds:(uint)aShotId :(LTResultsBlock)resultsBlock;

/**
 *  Returns the list of popular shots
 */
- (void)popularShots:(LTResultsBlock)resultsBlock;

/**
 *  Returns the list of everyone shots
 */
- (void)everyoneShots:(LTResultsBlock)resultsBlock;

/**
 *  Returns the list of debuts shots
 */
- (void)debutsShots:(LTResultsBlock)resultsBlock;

/**
 *  Returns the most recent shots published by those the player specified by :aPlayerId is following.
 */
- (void)shotsOfFollowing:(NSString *)aPlayerId :(LTResultsBlock)resultsBlock;

/**
 *  Returns the set of comments for the shot specified by :aShotId.
 */
- (void)comments:(uint)aShotId :(LTResultsBlock)resultsBlock;

/**
 *  Returns the most recent shots for the player specified by :aPlayerId.
 */
- (void)shotsOfPlayer:(NSString *)aPlayerId :(LTResultsBlock)resultsBlock;

/**
 *  Returns shots liked by the player specified by :aPlayerId.
 */
- (void)shotsPlayerLikes:(NSString *)aPlayerId :(LTResultsBlock)resultsBlock;

/**
 *  Returns profile details for a player specified by :aPlayerId.
 */
- (void)player:(NSString *)aPlayerId :(LTResultBlock)resultBlock;

/**
 *  Returns the list of followers for a player specified by :aPlayerId.
 */
- (void)playerFollowers:(NSString *)aPlayerId :(LTResultsBlock)resultsBlock;

/**
 *  Returns the list of players followed by the player specified by :aPlayerId.
 */
- (void)playersFollowedBy:(NSString *)aPlayerId :(LTResultsBlock)resultsBlock;

/**
 *  Returns the list of players drafted by the player specified by :aPlayerId.
 */
- (void)playersDraftedBy:(NSString *)aPlayerId :(LTResultsBlock)resultsBlock;

@end
