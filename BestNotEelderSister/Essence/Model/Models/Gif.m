//
//  Gif.m
//
//  Created by   on 16/3/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Gif.h"


NSString *const kGifImages = @"images";
NSString *const kGifGifThumbnail = @"gif_thumbnail";
NSString *const kGifWidth = @"width";
NSString *const kGifDownloadUrl = @"download_url";
NSString *const kGifHeight = @"height";


@interface Gif ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Gif

@synthesize images = _images;
@synthesize gifThumbnail = _gifThumbnail;
@synthesize width = _width;
@synthesize downloadUrl = _downloadUrl;
@synthesize height = _height;


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
            self.images = [self objectOrNilForKey:kGifImages fromDictionary:dict];
            self.gifThumbnail = [self objectOrNilForKey:kGifGifThumbnail fromDictionary:dict];
            self.width = [[self objectOrNilForKey:kGifWidth fromDictionary:dict] doubleValue];
            self.downloadUrl = [self objectOrNilForKey:kGifDownloadUrl fromDictionary:dict];
            self.height = [[self objectOrNilForKey:kGifHeight fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForImages = [NSMutableArray array];
    for (NSObject *subArrayObject in self.images) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForImages addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForImages addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImages] forKey:kGifImages];
    NSMutableArray *tempArrayForGifThumbnail = [NSMutableArray array];
    for (NSObject *subArrayObject in self.gifThumbnail) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGifThumbnail addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGifThumbnail addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGifThumbnail] forKey:kGifGifThumbnail];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kGifWidth];
    NSMutableArray *tempArrayForDownloadUrl = [NSMutableArray array];
    for (NSObject *subArrayObject in self.downloadUrl) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDownloadUrl addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDownloadUrl addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDownloadUrl] forKey:kGifDownloadUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kGifHeight];

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

    self.images = [aDecoder decodeObjectForKey:kGifImages];
    self.gifThumbnail = [aDecoder decodeObjectForKey:kGifGifThumbnail];
    self.width = [aDecoder decodeDoubleForKey:kGifWidth];
    self.downloadUrl = [aDecoder decodeObjectForKey:kGifDownloadUrl];
    self.height = [aDecoder decodeDoubleForKey:kGifHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_images forKey:kGifImages];
    [aCoder encodeObject:_gifThumbnail forKey:kGifGifThumbnail];
    [aCoder encodeDouble:_width forKey:kGifWidth];
    [aCoder encodeObject:_downloadUrl forKey:kGifDownloadUrl];
    [aCoder encodeDouble:_height forKey:kGifHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    Gif *copy = [[Gif alloc] init];
    
    if (copy) {

        copy.images = [self.images copyWithZone:zone];
        copy.gifThumbnail = [self.gifThumbnail copyWithZone:zone];
        copy.width = self.width;
        copy.downloadUrl = [self.downloadUrl copyWithZone:zone];
        copy.height = self.height;
    }
    
    return copy;
}


@end
