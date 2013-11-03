//
//  LTDribbbleAPI.m
//  LTDribbbleAPI
//
//  Created by Lex on 11/1/13.
//  Copyright (c) 2013 Lex Tang. All rights reserved.
//

#import "LTDribbbleAPI.h"
#import "LTDribbbleResponseSerializer.h"

#define f(fmt, val) [NSString stringWithFormat : fmt, val]

NSString *const DRIBBBLE_API = @"http://api.dribbble.com/";

@implementation LTDribbbleAPI

+ (LTDribbbleAPI *) shared
{
    static dispatch_once_t onceToken;
    static LTDribbbleAPI *__instance;
    
    dispatch_once(&onceToken, ^{
        __instance = [[self alloc] initWithBaseURL:[NSURL URLWithString:DRIBBBLE_API]];
        __instance.securityPolicy.allowInvalidCertificates = YES;
        __instance.perPage = 30;
        __instance.responseSerializer = [LTDribbbleResponseSerializer serializer];
        
        NSOperationQueue *operationQueue = __instance.operationQueue;
        [__instance.reachabilityManager setReachabilityStatusChangeBlock: ^(AFNetworkReachabilityStatus status) {
            switch (status)
            {
                case AFNetworkReachabilityStatusReachableViaWWAN:
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    [operationQueue setSuspended:NO];
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                default:
                    [operationQueue setSuspended:YES];
                    break;
            }
        }];
    });
    return __instance;
}

- (void) shot:(uint)aShotId :(LTResultBlock)resultBlock
{
    [self GET:f(rShotById, aShotId) parameters:nil success: ^(AFHTTPRequestOperation *operation, LTDribbbleShot *shot) {
        if (resultBlock)
        {
            resultBlock(shot, nil);
        }
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        if (resultBlock)
        {
            resultBlock(nil, error);
        }
    }];
}

- (void) rebounds:(uint)aShotId :(LTResultsBlock)resultsBlock
{
    [self GET:f(rShotRebounds, aShotId) parameters:nil success: ^(AFHTTPRequestOperation *operation, LTDribbbleResults *results) {
        if (resultsBlock)
        {
            resultsBlock(results, nil);
        }
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        if (resultsBlock)
        {
            resultsBlock(nil, error);
        }
    }];
}

- (void) shots:(NSString *)listType :(LTResultsBlock)resultsBlock
{
    [self GET:listType parameters:nil success: ^(AFHTTPRequestOperation *operation, LTDribbbleResults *results) {
        if (resultsBlock)
        {
            resultsBlock(results, nil);
        }
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        if (resultsBlock)
        {
            resultsBlock(nil, error);
        }
    }];
}

- (void) popularShots:(LTResultsBlock)resultsBlock
{
    [self shots:rPopularShots:resultsBlock];
}

- (void) everyoneShots:(LTResultsBlock)resultsBlock
{
    [self shots:rEveryoneShots:resultsBlock];
}

- (void) debutsShots:(LTResultsBlock)resultsBlock
{
    [self shots:rDebutsShots:resultsBlock];
}

- (void) shotsOfFollowing:(NSString *)aPlayerId :(LTResultsBlock)resultsBlock
{
    [self GET:f(rFollowingShots, aPlayerId) parameters:nil success: ^(AFHTTPRequestOperation *operation, LTDribbbleResults *results) {
        if (resultsBlock)
        {
            resultsBlock(results, nil);
        }
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        if (resultsBlock)
        {
            resultsBlock(nil, error);
        }
    }];
}

- (void) comments:(uint)aShotId :(LTResultsBlock)resultsBlock
{
    [self GET:f(rShotComments, aShotId) parameters:nil success: ^(AFHTTPRequestOperation *operation, LTDribbbleResults *results) {
        if (resultsBlock)
        {
            resultsBlock(results, nil);
        }
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        if (resultsBlock)
        {
            resultsBlock(nil, error);
        }
    }];
}

- (void) shotsOfPlayer:(NSString *)aPlayerId :(LTResultsBlock)resultsBlock
{
    [self GET:f(rPlayerShots, aPlayerId) parameters:nil success: ^(AFHTTPRequestOperation *operation, LTDribbbleResults *results) {
        if (resultsBlock)
        {
            resultsBlock(results, nil);
        }
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        if (resultsBlock)
        {
            resultsBlock(nil, error);
        }
    }];
}

- (void) shotsPlayerLikes:(NSString *)aPlayerId :(LTResultsBlock)resultsBlock
{
    [self GET:f(rPlayerLikes, aPlayerId) parameters:nil success: ^(AFHTTPRequestOperation *operation, LTDribbbleResults *results) {
        if (resultsBlock)
        {
            resultsBlock(results, nil);
        }
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        if (resultsBlock)
        {
            resultsBlock(nil, error);
        }
    }];
}

- (void) player:(NSString *)aPlayerId :(LTResultBlock)resultBlock
{
    [self GET:f(rPlayerById, aPlayerId) parameters:nil success: ^(AFHTTPRequestOperation *operation, LTDribbblePlayer *player) {
        if (resultBlock)
        {
            resultBlock(player, nil);
        }
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        if (resultBlock)
        {
            resultBlock(nil, error);
        }
    }];
}

- (void) playersOfType:(NSString *)relationType ofPlayer:(NSString *)aPlayerId :(LTResultsBlock)resultsBlock
{
    [self GET:f(relationType, aPlayerId) parameters:nil success: ^(AFHTTPRequestOperation *operation, LTDribbbleResults *results) {
        if (resultsBlock)
        {
            resultsBlock(results, nil);
        }
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        if (resultsBlock)
        {
            resultsBlock(nil, error);
        }
    }];
}

- (void) playerFollowers:(NSString *)aPlayerId :(LTResultsBlock)resultsBlock
{
    [self playersOfType:rPlayerFollowers ofPlayer:aPlayerId:resultsBlock];
}

- (void) playersFollowedBy:(NSString *)aPlayerId :(LTResultsBlock)resultsBlock
{
    [self playersOfType:rPlayerFollowing ofPlayer:aPlayerId:resultsBlock];
}

- (void) playersDraftedBy:(NSString *)aPlayerId :(LTResultsBlock)resultsBlock
{
    [self playersOfType:rPlayerDraftees ofPlayer:aPlayerId:resultsBlock];
}

@end
