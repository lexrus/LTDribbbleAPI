//
//  LTDribbbleResults.m
//  LTDribbbleAPI
//
//  Created by Lex on 11/2/13.
//  Copyright (c) 2013 Lex Tang. All rights reserved.
//

#import "LTDribbbleResults.h"

@implementation LTDribbbleResults

+ (LTDribbbleResults *) results
{
    return [[LTDribbbleResults alloc] init];
}

+ (LTDribbbleResults *) resultsWithItems:(NSArray *)items pagination:(LTDribbblePagination *)aPagination
{
    LTDribbbleResults *results = [LTDribbbleResults results];
    results.items = items;
    results.pagination = aPagination;
    return results;
}

@end
