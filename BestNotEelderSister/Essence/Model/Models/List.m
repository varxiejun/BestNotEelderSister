//
//  List.m
//
//  Created by   on 16/3/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "List.h"
#import "TopComment.h"
#import "Gif.h"
#import "Tags.h"
#import "Image.h"
#import "U.h"
#import "Video.h"


NSString *const kListId = @"id";
NSString *const kListUp = @"up";
NSString *const kListPasstime = @"passtime";
NSString *const kListTopComment = @"top_comment";
NSString *const kListGif = @"gif";
NSString *const kListTags = @"tags";
NSString *const kListType = @"type";
NSString *const kListComment = @"comment";
NSString *const kListImage = @"image";
NSString *const kListDown = @"down";
NSString *const kListText = @"text";
NSString *const kListShareUrl = @"share_url";
NSString *const kListU = @"u";
NSString *const kListForward = @"forward";
NSString *const kListBookmark = @"bookmark";
NSString *const kListVideo = @"video";


@interface List ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation List

@synthesize listIdentifier = _listIdentifier;
@synthesize up = _up;
@synthesize passtime = _passtime;
@synthesize topComment = _topComment;
@synthesize gif = _gif;
@synthesize tags = _tags;
@synthesize type = _type;
@synthesize comment = _comment;
@synthesize image = _image;
@synthesize down = _down;
@synthesize text = _text;
@synthesize shareUrl = _shareUrl;
@synthesize u = _u;
@synthesize forward = _forward;
@synthesize bookmark = _bookmark;
@synthesize video = _video;


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
            self.listIdentifier = [self objectOrNilForKey:kListId fromDictionary:dict];
            self.up = [self objectOrNilForKey:kListUp fromDictionary:dict];
            self.passtime = [self objectOrNilForKey:kListPasstime fromDictionary:dict];
            self.topComment = [TopComment modelObjectWithDictionary:[dict objectForKey:kListTopComment]];
            self.gif = [Gif modelObjectWithDictionary:[dict objectForKey:kListGif]];
    NSObject *receivedTags = [dict objectForKey:kListTags];
    NSMutableArray *parsedTags = [NSMutableArray array];
    if ([receivedTags isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedTags) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedTags addObject:[Tags modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedTags isKindOfClass:[NSDictionary class]]) {
       [parsedTags addObject:[Tags modelObjectWithDictionary:(NSDictionary *)receivedTags]];
    }

    self.tags = [NSArray arrayWithArray:parsedTags];
            self.type = [self objectOrNilForKey:kListType fromDictionary:dict];
            self.comment = [self objectOrNilForKey:kListComment fromDictionary:dict];
            self.image = [Image modelObjectWithDictionary:[dict objectForKey:kListImage]];
            self.down = [[self objectOrNilForKey:kListDown fromDictionary:dict] doubleValue];
            self.text = [self objectOrNilForKey:kListText fromDictionary:dict];
            self.shareUrl = [self objectOrNilForKey:kListShareUrl fromDictionary:dict];
            self.u = [U modelObjectWithDictionary:[dict objectForKey:kListU]];
            self.forward = [self objectOrNilForKey:kListForward fromDictionary:dict];
            self.bookmark = [self objectOrNilForKey:kListBookmark fromDictionary:dict];
            self.video = [Video modelObjectWithDictionary:[dict objectForKey:kListVideo]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listIdentifier forKey:kListId];
    [mutableDict setValue:self.up forKey:kListUp];
    [mutableDict setValue:self.passtime forKey:kListPasstime];
    [mutableDict setValue:[self.topComment dictionaryRepresentation] forKey:kListTopComment];
    [mutableDict setValue:[self.gif dictionaryRepresentation] forKey:kListGif];
    NSMutableArray *tempArrayForTags = [NSMutableArray array];
    for (NSObject *subArrayObject in self.tags) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTags addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTags addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTags] forKey:kListTags];
    [mutableDict setValue:self.type forKey:kListType];
    [mutableDict setValue:self.comment forKey:kListComment];
    [mutableDict setValue:[self.image dictionaryRepresentation] forKey:kListImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.down] forKey:kListDown];
    [mutableDict setValue:self.text forKey:kListText];
    [mutableDict setValue:self.shareUrl forKey:kListShareUrl];
    [mutableDict setValue:[self.u dictionaryRepresentation] forKey:kListU];
    [mutableDict setValue:self.forward forKey:kListForward];
    [mutableDict setValue:self.bookmark forKey:kListBookmark];
    [mutableDict setValue:[self.video dictionaryRepresentation] forKey:kListVideo];

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

    self.listIdentifier = [aDecoder decodeObjectForKey:kListId];
    self.up = [aDecoder decodeObjectForKey:kListUp];
    self.passtime = [aDecoder decodeObjectForKey:kListPasstime];
    self.topComment = [aDecoder decodeObjectForKey:kListTopComment];
    self.gif = [aDecoder decodeObjectForKey:kListGif];
    self.tags = [aDecoder decodeObjectForKey:kListTags];
    self.type = [aDecoder decodeObjectForKey:kListType];
    self.comment = [aDecoder decodeObjectForKey:kListComment];
    self.image = [aDecoder decodeObjectForKey:kListImage];
    self.down = [aDecoder decodeDoubleForKey:kListDown];
    self.text = [aDecoder decodeObjectForKey:kListText];
    self.shareUrl = [aDecoder decodeObjectForKey:kListShareUrl];
    self.u = [aDecoder decodeObjectForKey:kListU];
    self.forward = [aDecoder decodeObjectForKey:kListForward];
    self.bookmark = [aDecoder decodeObjectForKey:kListBookmark];
    self.video = [aDecoder decodeObjectForKey:kListVideo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listIdentifier forKey:kListId];
    [aCoder encodeObject:_up forKey:kListUp];
    [aCoder encodeObject:_passtime forKey:kListPasstime];
    [aCoder encodeObject:_topComment forKey:kListTopComment];
    [aCoder encodeObject:_gif forKey:kListGif];
    [aCoder encodeObject:_tags forKey:kListTags];
    [aCoder encodeObject:_type forKey:kListType];
    [aCoder encodeObject:_comment forKey:kListComment];
    [aCoder encodeObject:_image forKey:kListImage];
    [aCoder encodeDouble:_down forKey:kListDown];
    [aCoder encodeObject:_text forKey:kListText];
    [aCoder encodeObject:_shareUrl forKey:kListShareUrl];
    [aCoder encodeObject:_u forKey:kListU];
    [aCoder encodeObject:_forward forKey:kListForward];
    [aCoder encodeObject:_bookmark forKey:kListBookmark];
    [aCoder encodeObject:_video forKey:kListVideo];
}

- (id)copyWithZone:(NSZone *)zone
{
    List *copy = [[List alloc] init];
    
    if (copy) {

        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.up = [self.up copyWithZone:zone];
        copy.passtime = [self.passtime copyWithZone:zone];
        copy.topComment = [self.topComment copyWithZone:zone];
        copy.gif = [self.gif copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.comment = [self.comment copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.down = self.down;
        copy.text = [self.text copyWithZone:zone];
        copy.shareUrl = [self.shareUrl copyWithZone:zone];
        copy.u = [self.u copyWithZone:zone];
        copy.forward = [self.forward copyWithZone:zone];
        copy.bookmark = [self.bookmark copyWithZone:zone];
        copy.video = [self.video copyWithZone:zone];
    }
    
    return copy;
}


@end
