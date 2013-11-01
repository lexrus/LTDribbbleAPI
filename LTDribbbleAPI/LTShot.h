//
//  LTShot.h
//
//  Created by Lex  on 11/1/13
//  Copyright (c) 2013 LexTang.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LTPlayer;

@interface LTShot : NSObject <NSCoding>

@property (nonatomic, assign) double internalBaseClassIdentifier;
@property (nonatomic, strong) NSString *imageTeaserUrl;
@property (nonatomic, assign) double reboundSourceId;
@property (nonatomic, assign) double viewsCount;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) double width;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double reboundsCount;
@property (nonatomic, assign) double height;
@property (nonatomic, strong) LTPlayer *player;
@property (nonatomic, assign) double likesCount;
@property (nonatomic, assign) double commentsCount;
@property (nonatomic, strong) NSString *shortUrl;

+ (LTShot *) modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype) initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *) dictionaryRepresentation;

@end
