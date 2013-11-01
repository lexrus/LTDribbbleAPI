//
//  LTDribbblePagination.m
//  LTDribbbleAPI
//
//  Created by Lex on 11/1/13.
//  Copyright (c) 2013 Lex Tang. All rights reserved.
//

#import "LTDribbblePagination.h"

@implementation LTDribbblePagination

+ (LTDribbblePagination *) paginationOf:(NSInteger)page
                                  pages:(NSInteger)pages
                                perPage:(NSInteger)perPage
                             totalPages:(NSInteger)totalPages
{
    LTDribbblePagination *pagination = [[LTDribbblePagination alloc] init];
    
    [pagination setPage:page];
    [pagination setPages:pages];
    [pagination setPerPage:perPage];
    [pagination setTotalPages:totalPages];
    
    return pagination;
}

+ (LTDribbblePagination *) paginationWithDictionary:(NSDictionary *)aDictionary
{
    if (aDictionary[@"page"] && aDictionary[@"pages"] && aDictionary[@"per_page"] && aDictionary[@"total"])
    {
        return [LTDribbblePagination paginationOf:[aDictionary[@"page"] integerValue]
                                            pages:[aDictionary[@"pages"] integerValue]
                                          perPage:[aDictionary[@"per_page"] integerValue]
                                       totalPages:[aDictionary[@"total"] integerValue]];
    }
    return nil;
}

@end
