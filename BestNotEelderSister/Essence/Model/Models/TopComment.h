//
//  TopComment.h
//
//  Created by   on 16/3/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class U;

@interface TopComment : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double precid;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *likeCount;
@property (nonatomic, assign) double topCommentIdentifier;
@property (nonatomic, strong) U *u;
@property (nonatomic, assign) double preuid;
@property (nonatomic, assign) double voicetime;
@property (nonatomic, strong) NSString *voiceuri;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
