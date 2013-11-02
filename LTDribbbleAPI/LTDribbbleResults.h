//
//  LTDribbbleResults.h
//  LTDribbbleAPI
//
//  Created by Lex on 11/2/13.
//  Copyright (c) 2013 Lex Tang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTDribbblePagination.h"

@interface LTDribbbleResults : NSObject

@property (strong, nonatomic) LTDribbblePagination *pagination;
@property (strong, nonatomic) NSArray *items;

+ (LTDribbbleResults *) results;

+ (LTDribbbleResults *) resultsWithItems:(NSArray *)items pagination:(LTDribbblePagination *)aPagination;

@end
