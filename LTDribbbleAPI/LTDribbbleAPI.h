//
//  LTDribbbleAPI.h
//  LTDribbbleAPI
//
//  Created by Lex on 11/1/13.
//  Copyright (c) 2013 Lex Tang. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"
#import "LTDribbblePagination.h"
#import "LTDribbbleDataModels.h"

FOUNDATION_EXPORT NSString *const DRIBBBLE_API;

#define rShotById @"/shots/%i"
#define rShotRebounds @"/shots/%i/rebounds"
#define rDebutsShots @"/shots/debuts"
#define rEveryoneShots @"/shots/everyone"
#define rPopularShots @"/shots/popular"
#define rShotComments @"/shots/%i/comments"
#define rPlayerShots @"/players/%@/shots"
#define rPlayerFollwing @"/players/%@/shots/following"
#define rPlayerLikes @"/players/%@/shots/likes"
#define rPlayerById @"/players/%@"
#define rPlayerFollowers @"/players/%@/followers"
#define rPlayerFollowing @"/players/%@/following"
#define rPlayerDraftees @"/players/%@/draftees"

typedef void (^LTResultBlock)(id result, NSError *error);
typedef void (^LTResultsBlock)(id results, LTDribbblePagination *pagination, NSError *error);

@interface LTDribbbleAPI : AFHTTPRequestOperationManager

+ (LTDribbbleAPI *) shared;

@property (assign, nonatomic) NSInteger perPage;

- (void)shotById:(uint)aId :(LTResultBlock)resultBlock;

@end
