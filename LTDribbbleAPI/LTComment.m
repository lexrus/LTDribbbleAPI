//
//  LTComment.m
//
//  Created by Lex  on 11/1/13
//  Copyright (c) 2013 LexTang.com. All rights reserved.
//

#import "LTComment.h"
#import "LTPlayer.h"


NSString *const kLTCommentBody = @"body";
NSString *const kLTCommentId = @"id";
NSString *const kLTCommentLikesCount = @"likes_count";
NSString *const kLTCommentPlayer = @"player";
NSString *const kLTCommentCreatedAt = @"created_at";


@interface LTComment ()

- (id) objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LTComment

@synthesize body = _body;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize likesCount = _likesCount;
@synthesize player = _player;
@synthesize createdAt = _createdAt;


+ (LTComment *) modelObjectWithDictionary:(NSDictionary *)dict
{
    LTComment *instance = [[LTComment alloc] initWithDictionary:dict];
    
    return instance;
}

- (instancetype) initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]])
    {
        self.body = [self objectOrNilForKey:kLTCommentBody fromDictionary:dict];
        self.internalBaseClassIdentifier = [[self objectOrNilForKey:kLTCommentId fromDictionary:dict] doubleValue];
        self.likesCount = [[self objectOrNilForKey:kLTCommentLikesCount fromDictionary:dict] doubleValue];
        self.player = [LTPlayer modelObjectWithDictionary:[dict objectForKey:kLTCommentPlayer]];
        self.createdAt = [self objectOrNilForKey:kLTCommentCreatedAt fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *) dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    
    [mutableDict setValue:self.body forKey:kLTCommentBody];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:kLTCommentId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likesCount] forKey:kLTCommentLikesCount];
    [mutableDict setValue:[self.player dictionaryRepresentation] forKey:kLTCommentPlayer];
    [mutableDict setValue:self.createdAt forKey:kLTCommentCreatedAt];
    
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
    
    self.body = [aDecoder decodeObjectForKey:kLTCommentBody];
    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kLTCommentId];
    self.likesCount = [aDecoder decodeDoubleForKey:kLTCommentLikesCount];
    self.player = [aDecoder decodeObjectForKey:kLTCommentPlayer];
    self.createdAt = [aDecoder decodeObjectForKey:kLTCommentCreatedAt];
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_body forKey:kLTCommentBody];
    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kLTCommentId];
    [aCoder encodeDouble:_likesCount forKey:kLTCommentLikesCount];
    [aCoder encodeObject:_player forKey:kLTCommentPlayer];
    [aCoder encodeObject:_createdAt forKey:kLTCommentCreatedAt];
}


@end
