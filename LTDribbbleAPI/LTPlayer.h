//
//  LTPlayer.h
//
//  Created by Lex  on 11/1/13
//  Copyright (c) 2013 LexTang.com. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LTPlayer : NSObject <NSCoding>

@property (nonatomic, strong) NSString *twitterScreenName;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, assign) double drafteesCount;
@property (nonatomic, assign) double followingCount;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *websiteUrl;
@property (nonatomic, assign) double commentsCount;
@property (nonatomic, assign) double shotsCount;
@property (nonatomic, assign) double reboundsReceivedCount;
@property (nonatomic, assign) double draftedByPlayerId;
@property (nonatomic, strong) NSString *avatarUrl;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double playerIdentifier;
@property (nonatomic, assign) double reboundsCount;
@property (nonatomic, assign) double followersCount;
@property (nonatomic, assign) double likesReceivedCount;
@property (nonatomic, assign) double likesCount;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) double commentsReceivedCount;
@property (nonatomic, strong) NSString *username;

+ (LTPlayer *) modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype) initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *) dictionaryRepresentation;

@end
