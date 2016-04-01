//
//  TopComment.m
//
//  Created by   on 16/3/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "TopComment.h"
#import "U.h"


NSString *const kTopCommentPrecid = @"precid";
NSString *const kTopCommentContent = @"content";
NSString *const kTopCommentLikeCount = @"like_count";
NSString *const kTopCommentId = @"id";
NSString *const kTopCommentU = @"u";
NSString *const kTopCommentPreuid = @"preuid";
NSString *const kTopCommentVoicetime = @"voicetime";
NSString *const kTopCommentVoiceuri = @"voiceuri";


@interface TopComment ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TopComment

@synthesize precid = _precid;
@synthesize content = _content;
@synthesize likeCount = _likeCount;
@synthesize topCommentIdentifier = _topCommentIdentifier;
@synthesize u = _u;
@synthesize preuid = _preuid;
@synthesize voicetime = _voicetime;
@synthesize voiceuri = _voiceuri;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.precid = [[self objectOrNilForKey:kTopCommentPrecid fromDictionary:dict] doubleValue];
            self.content = [self objectOrNilForKey:kTopCommentContent fromDictionary:dict];
            self.likeCount = [self objectOrNilForKey:kTopCommentLikeCount fromDictionary:dict];
            self.topCommentIdentifier = [[self objectOrNilForKey:kTopCommentId fromDictionary:dict] doubleValue];
            self.u = [U modelObjectWithDictionary:[dict objectForKey:kTopCommentU]];
            self.preuid = [[self objectOrNilForKey:kTopCommentPreuid fromDictionary:dict] doubleValue];
            self.voicetime = [[self objectOrNilForKey:kTopCommentVoicetime fromDictionary:dict] doubleValue];
            self.voiceuri = [self objectOrNilForKey:kTopCommentVoiceuri fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.precid] forKey:kTopCommentPrecid];
    [mutableDict setValue:self.content forKey:kTopCommentContent];
    [mutableDict setValue:self.likeCount forKey:kTopCommentLikeCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.topCommentIdentifier] forKey:kTopCommentId];
    [mutableDict setValue:[self.u dictionaryRepresentation] forKey:kTopCommentU];
    [mutableDict setValue:[NSNumber numberWithDouble:self.preuid] forKey:kTopCommentPreuid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.voicetime] forKey:kTopCommentVoicetime];
    [mutableDict setValue:self.voiceuri forKey:kTopCommentVoiceuri];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.precid = [aDecoder decodeDoubleForKey:kTopCommentPrecid];
    self.content = [aDecoder decodeObjectForKey:kTopCommentContent];
    self.likeCount = [aDecoder decodeObjectForKey:kTopCommentLikeCount];
    self.topCommentIdentifier = [aDecoder decodeDoubleForKey:kTopCommentId];
    self.u = [aDecoder decodeObjectForKey:kTopCommentU];
    self.preuid = [aDecoder decodeDoubleForKey:kTopCommentPreuid];
    self.voicetime = [aDecoder decodeDoubleForKey:kTopCommentVoicetime];
    self.voiceuri = [aDecoder decodeObjectForKey:kTopCommentVoiceuri];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_precid forKey:kTopCommentPrecid];
    [aCoder encodeObject:_content forKey:kTopCommentContent];
    [aCoder encodeObject:_likeCount forKey:kTopCommentLikeCount];
    [aCoder encodeDouble:_topCommentIdentifier forKey:kTopCommentId];
    [aCoder encodeObject:_u forKey:kTopCommentU];
    [aCoder encodeDouble:_preuid forKey:kTopCommentPreuid];
    [aCoder encodeDouble:_voicetime forKey:kTopCommentVoicetime];
    [aCoder encodeObject:_voiceuri forKey:kTopCommentVoiceuri];
}

- (id)copyWithZone:(NSZone *)zone
{
    TopComment *copy = [[TopComment alloc] init];
    
    if (copy) {

        copy.precid = self.precid;
        copy.content = [self.content copyWithZone:zone];
        copy.likeCount = [self.likeCount copyWithZone:zone];
        copy.topCommentIdentifier = self.topCommentIdentifier;
        copy.u = [self.u copyWithZone:zone];
        copy.preuid = self.preuid;
        copy.voicetime = self.voicetime;
        copy.voiceuri = [self.voiceuri copyWithZone:zone];
    }
    
    return copy;
}


@end
