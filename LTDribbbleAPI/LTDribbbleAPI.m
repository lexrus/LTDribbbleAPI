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
#define pageParamater(pageIndex) @{@"per_page": @(self.perPage), @"page": @(pageIndex)}
#define kUserAgent @"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9) AppleWebKit/537.71 (KHTML, like Gecko) Version/7.0 Safari/537.71"

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
        [__instance.requestSerializer setValue:kUserAgent forHTTPHeaderField:@"User-Agent"];
        
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
    [self GET:f(rShotById, aShotId) parameters:nil
      success: ^(AFHTTPRequestOperation *operation, LTDribbbleShot *shot) {
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

- (void) rebounds:(uint)aShotId page:(uint)page :(LTResultsBlock)resultsBlock
{
    [self GET:f(rShotRebounds, aShotId) parameters:pageParamater(page)
      success: ^(AFHTTPRequestOperation *operation, LTDribbbleResults *results) {
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

- (void) shots:(NSString *)listType page:(uint)page :(LTResultsBlock)resultsBlock
{
    [self GET:listType parameters:pageParamater(page)
      success: ^(AFHTTPRequestOperation *operation, LTDribbbleResults *results) {
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

- (void) popularShots:(uint)page :(LTResultsBlock)resultsBlock
{
    [self shots:rPopularShots page:page :resultsBlock];
}

- (void) everyoneShots:(uint)page :(LTResultsBlock)resultsBlock
{
    [self shots:rEveryoneShots page:page :resultsBlock];
}

- (void) debutsShots:(uint)page :(LTResultsBlock)resultsBlock
{
    [self shots:rDebutsShots page:page :resultsBlock];
}

- (void) shotsOfFollowing:(NSString *)aPlayerId page:(uint)page :(LTResultsBlock)resultsBlock
{
    [self GET:f(rFollowingShots, aPlayerId) parameters:pageParamater(page)
      success: ^(AFHTTPRequestOperation *operation, LTDribbbleResults *results) {
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

- (void) comments:(uint)aShotId page:(uint)page :(LTResultsBlock)resultsBlock
{
    [self GET:f(rShotComments, aShotId) parameters:pageParamater(page)
      success: ^(AFHTTPRequestOperation *operation, LTDribbbleResults *results) {
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

- (void) shotsOfPlayer:(NSString *)aPlayerId page:(uint)page :(LTResultsBlock)resultsBlock
{
    [self GET:f(rPlayerShots, aPlayerId) parameters:pageParamater(page)
      success: ^(AFHTTPRequestOperation *operation, LTDribbbleResults *results) {
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

- (void) shotsPlayerLikes:(NSString *)aPlayerId page:(uint)page :(LTResultsBlock)resultsBlock
{
    [self GET:f(rPlayerLikes, aPlayerId) parameters:pageParamater(page)
      success: ^(AFHTTPRequestOperation *operation, LTDribbbleResults *results) {
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

- (void) playersOfType:(NSString *)relationType page:(uint)page ofPlayer:(NSString *)aPlayerId :(LTResultsBlock)resultsBlock
{
    [self GET:f(relationType, aPlayerId) parameters:pageParamater(page)
      success: ^(AFHTTPRequestOperation *operation, LTDribbbleResults *results) {
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

- (void) playerFollowers:(NSString *)aPlayerId page:(uint)page :(LTResultsBlock)resultsBlock
{
    [self playersOfType:rPlayerFollowers page:page ofPlayer:aPlayerId:resultsBlock];
}

- (void) playersFollowedBy:(NSString *)aPlayerId page:(uint)page :(LTResultsBlock)resultsBlock
{
    [self playersOfType:rPlayerFollowing page:page ofPlayer:aPlayerId:resultsBlock];
}

- (void) playersDraftedBy:(NSString *)aPlayerId page:(uint)page :(LTResultsBlock)resultsBlock
{
    [self playersOfType:rPlayerDraftees page:page ofPlayer:aPlayerId:resultsBlock];
}

@end
