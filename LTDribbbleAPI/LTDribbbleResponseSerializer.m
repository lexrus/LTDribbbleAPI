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
        if (object[@"message"])
        {
            NSError *responsedError = [NSError errorWithDomain:LTErrorDomain
                                                          code:NSURLErrorDataNotAllowed
                                                      userInfo:@{ NSLocalizedDescriptionKey:object[@"message"] }];
            *error = responsedError;
        }
        else if (object[@"title"] && object[@"width"])
        {
            return [LTShot modelObjectWithDictionary:object];
        }
    }
    
    return object;
}

@end
