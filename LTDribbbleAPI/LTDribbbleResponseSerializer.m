//
//  LTDribbbleResponseSerializer.m
//  LTDribbbleAPI
//
//  Created by Lex on 11/1/13.
//  Copyright (c) 2013 Lex Tang. All rights reserved.
//

#import "LTDribbbleResponseSerializer.h"
#import "LTDribbbleDataModels.h"

#define LTErrorDomain @"com.lextang.LTDribbbleAPI"

@implementation LTDribbbleResponseSerializer

- (instancetype) init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (BOOL) validateResponse:(NSHTTPURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error
{
    if ([response.MIMEType rangeOfString:@"json" options:NSCaseInsensitiveSearch].location != NSNotFound)
    {
        
    }
    return YES;
}

- (id) responseObjectForResponse:(NSURLResponse *)response
                            data:(NSData *)data
                           error:(NSError *__autoreleasing *)error
{
    id object = [super responseObjectForResponse:response data:data error:error];
    
    if ([object isKindOfClass:[NSDictionary class]])
    {
        // An error
        if (object[@"message"])
        {
            NSError *responsedError = [NSError errorWithDomain:LTErrorDomain
                                                          code:NSURLErrorDataNotAllowed
                                                      userInfo:@{ NSLocalizedDescriptionKey:object[@"message"] }];
            *error = responsedError;
            return object;
        }
        // A shot
        else if (object[@"title"] && object[@"width"])
        {
            return [LTDribbbleShot modelObjectWithDictionary:object];
        }
        // Results with pagination
        else if (object[@"shots"] && [object[@"shots"] isKindOfClass:[NSArray class]] && object[@"pages"])
        {
            NSMutableArray *shots = [NSMutableArray array];
            for (NSDictionary *shot in object[@"shots"])
            {
                [shots addObject:[LTDribbbleShot modelObjectWithDictionary:shot]];
            }
            LTDribbblePagination *pagination = [LTDribbblePagination paginationWithDictionary:object];
            return [LTDribbbleResults resultsWithItems:shots pagination:pagination];
        }
        // Comments with pagination
        else if (object[@"comments"] && [object[@"comments"] isKindOfClass:[NSArray class]] && object[@"pages"])
        {
            NSMutableArray *comments = [NSMutableArray array];
            for (NSDictionary *comment in object[@"comments"])
            {
                [comments addObject:[LTComment modelObjectWithDictionary:comment]];
            }
            LTDribbblePagination *pagination = [LTDribbblePagination paginationWithDictionary:object];
            return [LTDribbbleResults resultsWithItems:comments pagination:pagination];
        }
        // Players with pagination
        else if (object[@"players"] && [object[@"players"] isKindOfClass:[NSArray class]] && object[@"pages"])
        {
            NSMutableArray *players = [NSMutableArray array];
            for (NSDictionary *player in object[@"players"])
            {
                [players addObject:[LTDribbblePlayer modelObjectWithDictionary:player]];
            }
            LTDribbblePagination *pagination = [LTDribbblePagination paginationWithDictionary:object];
            return [LTDribbbleResults resultsWithItems:players pagination:pagination];
        }
        // A player
        else if (object[@"username"])
        {
            return [LTDribbblePlayer modelObjectWithDictionary:object];
        }
    }
    
    return object;
}

@end
