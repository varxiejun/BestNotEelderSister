//
//  Video.m
//
//  Created by   on 16/3/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Video.h"


NSString *const kVideoThumbnail = @"thumbnail";
NSString *const kVideoHeight = @"height";
NSString *const kVideoDownload = @"download";
NSString *const kVideoWidth = @"width";
NSString *const kVideoPlayfcount = @"playfcount";
NSString *const kVideoDuration = @"duration";
NSString *const kVideoVideo = @"video";
NSString *const kVideoPlaycount = @"playcount";


@interface Video ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Video

@synthesize thumbnail = _thumbnail;
@synthesize height = _height;
@synthesize download = _download;
@synthesize width = _width;
@synthesize playfcount = _playfcount;
@synthesize duration = _duration;
@synthesize video = _video;
@synthesize playcount = _playcount;


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
            self.thumbnail = [self objectOrNilForKey:kVideoThumbnail fromDictionary:dict];
            self.height = [[self objectOrNilForKey:kVideoHeight fromDictionary:dict] doubleValue];
            self.download = [self objectOrNilForKey:kVideoDownload fromDictionary:dict];
            self.width = [[self objectOrNilForKey:kVideoWidth fromDictionary:dict] doubleValue];
            self.playfcount = [[self objectOrNilForKey:kVideoPlayfcount fromDictionary:dict] doubleValue];
            self.duration = [[self objectOrNilForKey:kVideoDuration fromDictionary:dict] doubleValue];
            self.video = [self objectOrNilForKey:kVideoVideo fromDictionary:dict];
            self.playcount = [[self objectOrNilForKey:kVideoPlaycount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForThumbnail = [NSMutableArray array];
    for (NSObject *subArrayObject in self.thumbnail) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForThumbnail addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForThumbnail addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForThumbnail] forKey:kVideoThumbnail];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kVideoHeight];
    NSMutableArray *tempArrayForDownload = [NSMutableArray array];
    for (NSObject *subArrayObject in self.download) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDownload addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDownload addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDownload] forKey:kVideoDownload];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kVideoWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playfcount] forKey:kVideoPlayfcount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.duration] forKey:kVideoDuration];
    NSMutableArray *tempArrayForVideo = [NSMutableArray array];
    for (NSObject *subArrayObject in self.video) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForVideo addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForVideo addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForVideo] forKey:kVideoVideo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playcount] forKey:kVideoPlaycount];

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

    self.thumbnail = [aDecoder decodeObjectForKey:kVideoThumbnail];
    self.height = [aDecoder decodeDoubleForKey:kVideoHeight];
    self.download = [aDecoder decodeObjectForKey:kVideoDownload];
    self.width = [aDecoder decodeDoubleForKey:kVideoWidth];
    self.playfcount = [aDecoder decodeDoubleForKey:kVideoPlayfcount];
    self.duration = [aDecoder decodeDoubleForKey:kVideoDuration];
    self.video = [aDecoder decodeObjectForKey:kVideoVideo];
    self.playcount = [aDecoder decodeDoubleForKey:kVideoPlaycount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_thumbnail forKey:kVideoThumbnail];
    [aCoder encodeDouble:_height forKey:kVideoHeight];
    [aCoder encodeObject:_download forKey:kVideoDownload];
    [aCoder encodeDouble:_width forKey:kVideoWidth];
    [aCoder encodeDouble:_playfcount forKey:kVideoPlayfcount];
    [aCoder encodeDouble:_duration forKey:kVideoDuration];
    [aCoder encodeObject:_video forKey:kVideoVideo];
    [aCoder encodeDouble:_playcount forKey:kVideoPlaycount];
}

- (id)copyWithZone:(NSZone *)zone
{
    Video *copy = [[Video alloc] init];
    
    if (copy) {

        copy.thumbnail = [self.thumbnail copyWithZone:zone];
        copy.height = self.height;
        copy.download = [self.download copyWithZone:zone];
        copy.width = self.width;
        copy.playfcount = self.playfcount;
        copy.duration = self.duration;
        copy.video = [self.video copyWithZone:zone];
        copy.playcount = self.playcount;
    }
    
    return copy;
}


@end
