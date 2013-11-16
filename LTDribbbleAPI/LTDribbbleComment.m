//
//  LTDribbbleComment.m
//
//  Created by Lex  on 11/1/13
//  Copyright (c) 2013 LexTang.com. All rights reserved.
//

#import "LTDribbbleComment.h"
#import "LTDribbblePlayer.h"


NSString *const kLTDribbbleCommentBody = @"body";
NSString *const kLTDribbbleCommentId = @"id";
NSString *const kLTDribbbleCommentLikesCount = @"likes_count";
NSString *const kLTDribbbleCommentPlayer = @"player";
NSString *const kLTDribbbleCommentCreatedAt = @"created_at";


@interface LTDribbbleComment ()

- (id) objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LTDribbbleComment

@synthesize body = _body;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize likesCount = _likesCount;
@synthesize player = _player;
@synthesize createdAt = _createdAt;


+ (LTDribbbleComment *) modelObjectWithDictionary:(NSDictionary *)dict
{
    LTDribbbleComment *instance = [[LTDribbbleComment alloc] initWithDictionary:dict];
    
    return instance;
}

- (instancetype) initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]])
    {
        self.body = [self objectOrNilForKey:kLTDribbbleCommentBody fromDictionary:dict];
        self.internalBaseClassIdentifier = [[self objectOrNilForKey:kLTDribbbleCommentId fromDictionary:dict] doubleValue];
        self.likesCount = [[self objectOrNilForKey:kLTDribbbleCommentLikesCount fromDictionary:dict] doubleValue];
        self.player = [LTDribbblePlayer modelObjectWithDictionary:[dict objectForKey:kLTDribbbleCommentPlayer]];
        self.createdAt = [self objectOrNilForKey:kLTDribbbleCommentCreatedAt fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *) dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    
    [mutableDict setValue:self.body forKey:kLTDribbbleCommentBody];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:kLTDribbbleCommentId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likesCount] forKey:kLTDribbbleCommentLikesCount];
    [mutableDict setValue:[self.player dictionaryRepresentation] forKey:kLTDribbbleCommentPlayer];
    [mutableDict setValue:self.createdAt forKey:kLTDribbbleCommentCreatedAt];
    
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
    
    self.body = [aDecoder decodeObjectForKey:kLTDribbbleCommentBody];
    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kLTDribbbleCommentId];
    self.likesCount = [aDecoder decodeDoubleForKey:kLTDribbbleCommentLikesCount];
    self.player = [aDecoder decodeObjectForKey:kLTDribbbleCommentPlayer];
    self.createdAt = [aDecoder decodeObjectForKey:kLTDribbbleCommentCreatedAt];
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_body forKey:kLTDribbbleCommentBody];
    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kLTDribbbleCommentId];
    [aCoder encodeDouble:_likesCount forKey:kLTDribbbleCommentLikesCount];
    [aCoder encodeObject:_player forKey:kLTDribbbleCommentPlayer];
    [aCoder encodeObject:_createdAt forKey:kLTDribbbleCommentCreatedAt];
}


@end
