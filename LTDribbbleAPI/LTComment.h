//
//  LTComment.h
//
//  Created by Lex  on 11/1/13
//  Copyright (c) 2013 LexTang.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LTPlayer;

@interface LTComment : NSObject <NSCoding>

@property (nonatomic, strong) NSString *body;
@property (nonatomic, assign) double internalBaseClassIdentifier;
@property (nonatomic, assign) double likesCount;
@property (nonatomic, strong) LTPlayer *player;
@property (nonatomic, strong) NSString *createdAt;

+ (LTComment *) modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype) initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *) dictionaryRepresentation;

@end
