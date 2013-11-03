//
//  LTDribbbleShot.m
//
//  Created by Lex  on 11/1/13
//  Copyright (c) 2013 LexTang.com. All rights reserved.
//

#import "LTDribbbleShot.h"
#import "LTDribbblePlayer.h"


NSString *const kLTShotId = @"id";
NSString *const kLTShotImageTeaserUrl = @"image_teaser_url";
NSString *const kLTShotReboundSourceId = @"rebound_source_id";
NSString *const kLTShotViewsCount = @"views_count";
NSString *const kLTShotImageUrl = @"image_url";
NSString *const kLTShotUrl = @"url";
NSString *const kLTShotWidth = @"width";
NSString *const kLTShotCreatedAt = @"created_at";
NSString *const kLTShotTitle = @"title";
NSString *const kLTShotReboundsCount = @"rebounds_count";
NSString *const kLTShotHeight = @"height";
NSString *const kLTShotPlayer = @"player";
NSString *const kLTShotLikesCount = @"likes_count";
NSString *const kLTShotCommentsCount = @"comments_count";
NSString *const kLTShotShortUrl = @"short_url";


@interface LTDribbbleShot ()

- (id) objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LTDribbbleShot

@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize imageTeaserUrl = _imageTeaserUrl;
@synthesize reboundSourceId = _reboundSourceId;
@synthesize viewsCount = _viewsCount;
@synthesize imageUrl = _imageUrl;
@synthesize url = _url;
@synthesize width = _width;
@synthesize createdAt = _createdAt;
@synthesize title = _title;
@synthesize reboundsCount = _reboundsCount;
@synthesize height = _height;
@synthesize player = _player;
@synthesize likesCount = _likesCount;
@synthesize commentsCount = _commentsCount;
@synthesize shortUrl = _shortUrl;


+ (LTDribbbleShot *) modelObjectWithDictionary:(NSDictionary *)dict
{
    LTDribbbleShot *instance = [[LTDribbbleShot alloc] initWithDictionary:dict];
    
    return instance;
}

- (instancetype) initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]])
    {
        self.internalBaseClassIdentifier = [[self objectOrNilForKey:kLTShotId fromDictionary:dict] doubleValue];
        self.imageTeaserUrl = [self objectOrNilForKey:kLTShotImageTeaserUrl fromDictionary:dict];
        self.reboundSourceId = [[self objectOrNilForKey:kLTShotReboundSourceId fromDictionary:dict] doubleValue];
        self.viewsCount = [[self objectOrNilForKey:kLTShotViewsCount fromDictionary:dict] doubleValue];
        self.imageUrl = [self objectOrNilForKey:kLTShotImageUrl fromDictionary:dict];
        self.url = [self objectOrNilForKey:kLTShotUrl fromDictionary:dict];
        self.width = [[self objectOrNilForKey:kLTShotWidth fromDictionary:dict] doubleValue];
        self.createdAt = [self objectOrNilForKey:kLTShotCreatedAt fromDictionary:dict];
        self.title = [self objectOrNilForKey:kLTShotTitle fromDictionary:dict];
        self.reboundsCount = [[self objectOrNilForKey:kLTShotReboundsCount fromDictionary:dict] doubleValue];
        self.height = [[self objectOrNilForKey:kLTShotHeight fromDictionary:dict] doubleValue];
        self.player = [LTDribbblePlayer modelObjectWithDictionary:[dict objectForKey:kLTShotPlayer]];
        self.likesCount = [[self objectOrNilForKey:kLTShotLikesCount fromDictionary:dict] doubleValue];
        self.commentsCount = [[self objectOrNilForKey:kLTShotCommentsCount fromDictionary:dict] doubleValue];
        self.shortUrl = [self objectOrNilForKey:kLTShotShortUrl fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *) dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:kLTShotId];
    [mutableDict setValue:self.imageTeaserUrl forKey:kLTShotImageTeaserUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.reboundSourceId] forKey:kLTShotReboundSourceId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.viewsCount] forKey:kLTShotViewsCount];
    [mutableDict setValue:self.imageUrl forKey:kLTShotImageUrl];
    [mutableDict setValue:self.url forKey:kLTShotUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kLTShotWidth];
    [mutableDict setValue:self.createdAt forKey:kLTShotCreatedAt];
    [mutableDict setValue:self.title forKey:kLTShotTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.reboundsCount] forKey:kLTShotReboundsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kLTShotHeight];
    [mutableDict setValue:[self.player dictionaryRepresentation] forKey:kLTShotPlayer];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likesCount] forKey:kLTShotLikesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kLTShotCommentsCount];
    [mutableDict setValue:self.shortUrl forKey:kLTShotShortUrl];
    
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
    
    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kLTShotId];
    self.imageTeaserUrl = [aDecoder decodeObjectForKey:kLTShotImageTeaserUrl];
    self.reboundSourceId = [aDecoder decodeDoubleForKey:kLTShotReboundSourceId];
    self.viewsCount = [aDecoder decodeDoubleForKey:kLTShotViewsCount];
    self.imageUrl = [aDecoder decodeObjectForKey:kLTShotImageUrl];
    self.url = [aDecoder decodeObjectForKey:kLTShotUrl];
    self.width = [aDecoder decodeDoubleForKey:kLTShotWidth];
    self.createdAt = [aDecoder decodeObjectForKey:kLTShotCreatedAt];
    self.title = [aDecoder decodeObjectForKey:kLTShotTitle];
    self.reboundsCount = [aDecoder decodeDoubleForKey:kLTShotReboundsCount];
    self.height = [aDecoder decodeDoubleForKey:kLTShotHeight];
    self.player = [aDecoder decodeObjectForKey:kLTShotPlayer];
    self.likesCount = [aDecoder decodeDoubleForKey:kLTShotLikesCount];
    self.commentsCount = [aDecoder decodeDoubleForKey:kLTShotCommentsCount];
    self.shortUrl = [aDecoder decodeObjectForKey:kLTShotShortUrl];
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kLTShotId];
    [aCoder encodeObject:_imageTeaserUrl forKey:kLTShotImageTeaserUrl];
    [aCoder encodeDouble:_reboundSourceId forKey:kLTShotReboundSourceId];
    [aCoder encodeDouble:_viewsCount forKey:kLTShotViewsCount];
    [aCoder encodeObject:_imageUrl forKey:kLTShotImageUrl];
    [aCoder encodeObject:_url forKey:kLTShotUrl];
    [aCoder encodeDouble:_width forKey:kLTShotWidth];
    [aCoder encodeObject:_createdAt forKey:kLTShotCreatedAt];
    [aCoder encodeObject:_title forKey:kLTShotTitle];
    [aCoder encodeDouble:_reboundsCount forKey:kLTShotReboundsCount];
    [aCoder encodeDouble:_height forKey:kLTShotHeight];
    [aCoder encodeObject:_player forKey:kLTShotPlayer];
    [aCoder encodeDouble:_likesCount forKey:kLTShotLikesCount];
    [aCoder encodeDouble:_commentsCount forKey:kLTShotCommentsCount];
    [aCoder encodeObject:_shortUrl forKey:kLTShotShortUrl];
}


@end
