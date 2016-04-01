//
//  Image.m
//
//  Created by   on 16/3/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Image.h"


NSString *const kImageHeight = @"height";
NSString *const kImageMedium = @"medium";
NSString *const kImageWidth = @"width";
NSString *const kImageBig = @"big";
NSString *const kImageSmall = @"small";
NSString *const kImageDownloadUrl = @"download_url";


@interface Image ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Image

@synthesize height = _height;
@synthesize medium = _medium;
@synthesize width = _width;
@synthesize big = _big;
@synthesize small = _small;
@synthesize downloadUrl = _downloadUrl;


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
            self.height = [[self objectOrNilForKey:kImageHeight fromDictionary:dict] doubleValue];
            self.medium = [self objectOrNilForKey:kImageMedium fromDictionary:dict];
            self.width = [[self objectOrNilForKey:kImageWidth fromDictionary:dict] doubleValue];
            self.big = [self objectOrNilForKey:kImageBig fromDictionary:dict];
            self.small = [self objectOrNilForKey:kImageSmall fromDictionary:dict];
            self.downloadUrl = [self objectOrNilForKey:kImageDownloadUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kImageHeight];
    NSMutableArray *tempArrayForMedium = [NSMutableArray array];
    for (NSObject *subArrayObject in self.medium) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMedium addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMedium addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMedium] forKey:kImageMedium];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kImageWidth];
    NSMutableArray *tempArrayForBig = [NSMutableArray array];
    for (NSObject *subArrayObject in self.big) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBig addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBig addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBig] forKey:kImageBig];
    NSMutableArray *tempArrayForSmall = [NSMutableArray array];
    for (NSObject *subArrayObject in self.small) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSmall addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSmall addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSmall] forKey:kImageSmall];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDownloadUrl] forKey:kImageDownloadUrl];

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

    self.height = [aDecoder decodeDoubleForKey:kImageHeight];
    self.medium = [aDecoder decodeObjectForKey:kImageMedium];
    self.width = [aDecoder decodeDoubleForKey:kImageWidth];
    self.big = [aDecoder decodeObjectForKey:kImageBig];
    self.small = [aDecoder decodeObjectForKey:kImageSmall];
    self.downloadUrl = [aDecoder decodeObjectForKey:kImageDownloadUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_height forKey:kImageHeight];
    [aCoder encodeObject:_medium forKey:kImageMedium];
    [aCoder encodeDouble:_width forKey:kImageWidth];
    [aCoder encodeObject:_big forKey:kImageBig];
    [aCoder encodeObject:_small forKey:kImageSmall];
    [aCoder encodeObject:_downloadUrl forKey:kImageDownloadUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    Image *copy = [[Image alloc] init];
    
    if (copy) {

        copy.height = self.height;
        copy.medium = [self.medium copyWithZone:zone];
        copy.width = self.width;
        copy.big = [self.big copyWithZone:zone];
        copy.small = [self.small copyWithZone:zone];
        copy.downloadUrl = [self.downloadUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
