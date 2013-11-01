//
//  LTPlayer.m
//
//  Created by Lex  on 11/1/13
//  Copyright (c) 2013 LexTang.com. All rights reserved.
//

#import "LTPlayer.h"


NSString *const kLTPlayerTwitterScreenName = @"twitter_screen_name";
NSString *const kLTPlayerLocation = @"location";
NSString *const kLTPlayerDrafteesCount = @"draftees_count";
NSString *const kLTPlayerFollowingCount = @"following_count";
NSString *const kLTPlayerUrl = @"url";
NSString *const kLTPlayerWebsiteUrl = @"website_url";
NSString *const kLTPlayerCommentsCount = @"comments_count";
NSString *const kLTPlayerShotsCount = @"shots_count";
NSString *const kLTPlayerReboundsReceivedCount = @"rebounds_received_count";
NSString *const kLTPlayerDraftedByPlayerId = @"drafted_by_player_id";
NSString *const kLTPlayerAvatarUrl = @"avatar_url";
NSString *const kLTPlayerName = @"name";
NSString *const kLTPlayerId = @"id";
NSString *const kLTPlayerReboundsCount = @"rebounds_count";
NSString *const kLTPlayerFollowersCount = @"followers_count";
NSString *const kLTPlayerLikesReceivedCount = @"likes_received_count";
NSString *const kLTPlayerLikesCount = @"likes_count";
NSString *const kLTPlayerCreatedAt = @"created_at";
NSString *const kLTPlayerCommentsReceivedCount = @"comments_received_count";
NSString *const kLTPlayerUsername = @"username";


@interface LTPlayer ()

- (id) objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LTPlayer

@synthesize twitterScreenName = _twitterScreenName;
@synthesize location = _location;
@synthesize drafteesCount = _drafteesCount;
@synthesize followingCount = _followingCount;
@synthesize url = _url;
@synthesize websiteUrl = _websiteUrl;
@synthesize commentsCount = _commentsCount;
@synthesize shotsCount = _shotsCount;
@synthesize reboundsReceivedCount = _reboundsReceivedCount;
@synthesize draftedByPlayerId = _draftedByPlayerId;
@synthesize avatarUrl = _avatarUrl;
@synthesize name = _name;
@synthesize playerIdentifier = _playerIdentifier;
@synthesize reboundsCount = _reboundsCount;
@synthesize followersCount = _followersCount;
@synthesize likesReceivedCount = _likesReceivedCount;
@synthesize likesCount = _likesCount;
@synthesize createdAt = _createdAt;
@synthesize commentsReceivedCount = _commentsReceivedCount;
@synthesize username = _username;


+ (LTPlayer *) modelObjectWithDictionary:(NSDictionary *)dict
{
    LTPlayer *instance = [[LTPlayer alloc] initWithDictionary:dict];
    
    return instance;
}

- (instancetype) initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]])
    {
        self.twitterScreenName = [self objectOrNilForKey:kLTPlayerTwitterScreenName fromDictionary:dict];
        self.location = [self objectOrNilForKey:kLTPlayerLocation fromDictionary:dict];
        self.drafteesCount = [[self objectOrNilForKey:kLTPlayerDrafteesCount fromDictionary:dict] doubleValue];
        self.followingCount = [[self objectOrNilForKey:kLTPlayerFollowingCount fromDictionary:dict] doubleValue];
        self.url = [self objectOrNilForKey:kLTPlayerUrl fromDictionary:dict];
        self.websiteUrl = [self objectOrNilForKey:kLTPlayerWebsiteUrl fromDictionary:dict];
        self.commentsCount = [[self objectOrNilForKey:kLTPlayerCommentsCount fromDictionary:dict] doubleValue];
        self.shotsCount = [[self objectOrNilForKey:kLTPlayerShotsCount fromDictionary:dict] doubleValue];
        self.reboundsReceivedCount = [[self objectOrNilForKey:kLTPlayerReboundsReceivedCount fromDictionary:dict] doubleValue];
        self.draftedByPlayerId = [[self objectOrNilForKey:kLTPlayerDraftedByPlayerId fromDictionary:dict] doubleValue];
        self.avatarUrl = [self objectOrNilForKey:kLTPlayerAvatarUrl fromDictionary:dict];
        self.name = [self objectOrNilForKey:kLTPlayerName fromDictionary:dict];
        self.playerIdentifier = [[self objectOrNilForKey:kLTPlayerId fromDictionary:dict] doubleValue];
        self.reboundsCount = [[self objectOrNilForKey:kLTPlayerReboundsCount fromDictionary:dict] doubleValue];
        self.followersCount = [[self objectOrNilForKey:kLTPlayerFollowersCount fromDictionary:dict] doubleValue];
        self.likesReceivedCount = [[self objectOrNilForKey:kLTPlayerLikesReceivedCount fromDictionary:dict] doubleValue];
        self.likesCount = [[self objectOrNilForKey:kLTPlayerLikesCount fromDictionary:dict] doubleValue];
        self.createdAt = [self objectOrNilForKey:kLTPlayerCreatedAt fromDictionary:dict];
        self.commentsReceivedCount = [[self objectOrNilForKey:kLTPlayerCommentsReceivedCount fromDictionary:dict] doubleValue];
        self.username = [self objectOrNilForKey:kLTPlayerUsername fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *) dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    
    [mutableDict setValue:self.twitterScreenName forKey:kLTPlayerTwitterScreenName];
    [mutableDict setValue:self.location forKey:kLTPlayerLocation];
    [mutableDict setValue:[NSNumber numberWithDouble:self.drafteesCount] forKey:kLTPlayerDrafteesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followingCount] forKey:kLTPlayerFollowingCount];
    [mutableDict setValue:self.url forKey:kLTPlayerUrl];
    [mutableDict setValue:self.websiteUrl forKey:kLTPlayerWebsiteUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kLTPlayerCommentsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shotsCount] forKey:kLTPlayerShotsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.reboundsReceivedCount] forKey:kLTPlayerReboundsReceivedCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.draftedByPlayerId] forKey:kLTPlayerDraftedByPlayerId];
    [mutableDict setValue:self.avatarUrl forKey:kLTPlayerAvatarUrl];
    [mutableDict setValue:self.name forKey:kLTPlayerName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playerIdentifier] forKey:kLTPlayerId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.reboundsCount] forKey:kLTPlayerReboundsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followersCount] forKey:kLTPlayerFollowersCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likesReceivedCount] forKey:kLTPlayerLikesReceivedCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likesCount] forKey:kLTPlayerLikesCount];
    [mutableDict setValue:self.createdAt forKey:kLTPlayerCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsReceivedCount] forKey:kLTPlayerCommentsReceivedCount];
    [mutableDict setValue:self.username forKey:kLTPlayerUsername];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id) objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    self.twitterScreenName = [aDecoder decodeObjectForKey:kLTPlayerTwitterScreenName];
    self.location = [aDecoder decodeObjectForKey:kLTPlayerLocation];
    self.drafteesCount = [aDecoder decodeDoubleForKey:kLTPlayerDrafteesCount];
    self.followingCount = [aDecoder decodeDoubleForKey:kLTPlayerFollowingCount];
    self.url = [aDecoder decodeObjectForKey:kLTPlayerUrl];
    self.websiteUrl = [aDecoder decodeObjectForKey:kLTPlayerWebsiteUrl];
    self.commentsCount = [aDecoder decodeDoubleForKey:kLTPlayerCommentsCount];
    self.shotsCount = [aDecoder decodeDoubleForKey:kLTPlayerShotsCount];
    self.reboundsReceivedCount = [aDecoder decodeDoubleForKey:kLTPlayerReboundsReceivedCount];
    self.draftedByPlayerId = [aDecoder decodeDoubleForKey:kLTPlayerDraftedByPlayerId];
    self.avatarUrl = [aDecoder decodeObjectForKey:kLTPlayerAvatarUrl];
    self.name = [aDecoder decodeObjectForKey:kLTPlayerName];
    self.playerIdentifier = [aDecoder decodeDoubleForKey:kLTPlayerId];
    self.reboundsCount = [aDecoder decodeDoubleForKey:kLTPlayerReboundsCount];
    self.followersCount = [aDecoder decodeDoubleForKey:kLTPlayerFollowersCount];
    self.likesReceivedCount = [aDecoder decodeDoubleForKey:kLTPlayerLikesReceivedCount];
    self.likesCount = [aDecoder decodeDoubleForKey:kLTPlayerLikesCount];
    self.createdAt = [aDecoder decodeObjectForKey:kLTPlayerCreatedAt];
    self.commentsReceivedCount = [aDecoder decodeDoubleForKey:kLTPlayerCommentsReceivedCount];
    self.username = [aDecoder decodeObjectForKey:kLTPlayerUsername];
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_twitterScreenName forKey:kLTPlayerTwitterScreenName];
    [aCoder encodeObject:_location forKey:kLTPlayerLocation];
    [aCoder encodeDouble:_drafteesCount forKey:kLTPlayerDrafteesCount];
    [aCoder encodeDouble:_followingCount forKey:kLTPlayerFollowingCount];
    [aCoder encodeObject:_url forKey:kLTPlayerUrl];
    [aCoder encodeObject:_websiteUrl forKey:kLTPlayerWebsiteUrl];
    [aCoder encodeDouble:_commentsCount forKey:kLTPlayerCommentsCount];
    [aCoder encodeDouble:_shotsCount forKey:kLTPlayerShotsCount];
    [aCoder encodeDouble:_reboundsReceivedCount forKey:kLTPlayerReboundsReceivedCount];
    [aCoder encodeDouble:_draftedByPlayerId forKey:kLTPlayerDraftedByPlayerId];
    [aCoder encodeObject:_avatarUrl forKey:kLTPlayerAvatarUrl];
    [aCoder encodeObject:_name forKey:kLTPlayerName];
    [aCoder encodeDouble:_playerIdentifier forKey:kLTPlayerId];
    [aCoder encodeDouble:_reboundsCount forKey:kLTPlayerReboundsCount];
    [aCoder encodeDouble:_followersCount forKey:kLTPlayerFollowersCount];
    [aCoder encodeDouble:_likesReceivedCount forKey:kLTPlayerLikesReceivedCount];
    [aCoder encodeDouble:_likesCount forKey:kLTPlayerLikesCount];
    [aCoder encodeObject:_createdAt forKey:kLTPlayerCreatedAt];
    [aCoder encodeDouble:_commentsReceivedCount forKey:kLTPlayerCommentsReceivedCount];
    [aCoder encodeObject:_username forKey:kLTPlayerUsername];
}


@end
