//
//  LTDribbbleAPI.m
//  LTDribbbleAPI
//
//  Created by Lex on 11/1/13.
//  Copyright (c) 2013 Lex Tang. All rights reserved.
//

#import "LTDribbbleAPI.h"
#import "LTDribbbleResponseSerializer.h"

#define f(fmt, val) [NSString stringWithFormat:fmt, val]

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

- (void)shotById:(uint)aId :(LTResultBlock)resultBlock
{
    [self GET:f(rShotById, aId) parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (resultBlock)
            resultBlock(responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (resultBlock)
            resultBlock(nil, error);
    }];
}

@end
