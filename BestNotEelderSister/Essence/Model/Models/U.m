//
//  U.m
//
//  Created by   on 16/3/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "U.h"


NSString *const kUIsV = @"is_v";
NSString *const kUSex = @"sex";
NSString *const kUUid = @"uid";
NSString *const kUName = @"name";
NSString *const kUIsVip = @"is_vip";
NSString *const kUHeader = @"header";


@interface U ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation U

@synthesize isV = _isV;
@synthesize sex = _sex;
@synthesize uid = _uid;
@synthesize name = _name;
@synthesize isVip = _isVip;
@synthesize header = _header;


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
            self.isV = [[self objectOrNilForKey:kUIsV fromDictionary:dict] boolValue];
            self.sex = [self objectOrNilForKey:kUSex fromDictionary:dict];
            self.uid = [self objectOrNilForKey:kUUid fromDictionary:dict];
            self.name = [self objectOrNilForKey:kUName fromDictionary:dict];
            self.isVip = [[self objectOrNilForKey:kUIsVip fromDictionary:dict] boolValue];
            self.header = [self objectOrNilForKey:kUHeader fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.isV] forKey:kUIsV];
    [mutableDict setValue:self.sex forKey:kUSex];
    [mutableDict setValue:self.uid forKey:kUUid];
    [mutableDict setValue:self.name forKey:kUName];
    [mutableDict setValue:[NSNumber numberWithBool:self.isVip] forKey:kUIsVip];
    NSMutableArray *tempArrayForHeader = [NSMutableArray array];
    for (NSObject *subArrayObject in self.header) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHeader addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHeader addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHeader] forKey:kUHeader];

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

    self.isV = [aDecoder decodeBoolForKey:kUIsV];
    self.sex = [aDecoder decodeObjectForKey:kUSex];
    self.uid = [aDecoder decodeObjectForKey:kUUid];
    self.name = [aDecoder decodeObjectForKey:kUName];
    self.isVip = [aDecoder decodeBoolForKey:kUIsVip];
    self.header = [aDecoder decodeObjectForKey:kUHeader];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_isV forKey:kUIsV];
    [aCoder encodeObject:_sex forKey:kUSex];
    [aCoder encodeObject:_uid forKey:kUUid];
    [aCoder encodeObject:_name forKey:kUName];
    [aCoder encodeBool:_isVip forKey:kUIsVip];
    [aCoder encodeObject:_header forKey:kUHeader];
}

- (id)copyWithZone:(NSZone *)zone
{
    U *copy = [[U alloc] init];
    
    if (copy) {

        copy.isV = self.isV;
        copy.sex = [self.sex copyWithZone:zone];
        copy.uid = [self.uid copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.isVip = self.isVip;
        copy.header = [self.header copyWithZone:zone];
    }
    
    return copy;
}


@end
