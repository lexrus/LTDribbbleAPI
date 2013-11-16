//
//  LTDribbbleComment.h
//
//  Created by Lex  on 11/1/13
//  Copyright (c) 2013 LexTang.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LTDribbblePlayer;

@interface LTDribbbleComment : NSObject <NSCoding>

@property (nonatomic, strong) NSString *body;
@property (nonatomic, assign) double internalBaseClassIdentifier;
@property (nonatomic, assign) double likesCount;
@property (nonatomic, strong) LTDribbblePlayer *player;
@property (nonatomic, strong) NSString *createdAt;

+ (LTDribbbleComment *) modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype) initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *) dictionaryRepresentation;

@end
