//
//  LTDribbblePagination.h
//  LTDribbbleAPI
//
//  Created by Lex on 11/1/13.
//  Copyright (c) 2013 Lex Tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LTDribbblePagination : NSObject

@property (assign, nonatomic) NSInteger page;
@property (assign, nonatomic) NSInteger pages;
@property (assign, nonatomic) NSInteger perPage;
@property (assign, nonatomic) NSInteger totalPages;

+ (LTDribbblePagination *) paginationOf:(NSInteger)page
                                  pages:(NSInteger)pages
                                perPage:(NSInteger)perPage
                             totalPages:(NSInteger)totalPages;

+ (LTDribbblePagination *) paginationWithDictionary:(NSDictionary *)aDictionary;

@end
