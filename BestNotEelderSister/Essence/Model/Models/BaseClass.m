//
//  BaseClass.m
//
//  Created by   on 16/3/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BaseClass.h"
#import "Info.h"
#import "List.h"


NSString *const kBaseClassInfo = @"info";
NSString *const kBaseClassList = @"list";


@interface BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseClass

@synthesize info = _info;
@synthesize list = _list;


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
            self.info = [Info modelObjectWithDictionary:[dict objectForKey:kBaseClassInfo]];
    NSObject *receivedList = [dict objectForKey:kBaseClassList];
    NSMutableArray *parsedList = [NSMutableArray array];
    if ([receivedList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedList addObject:[List modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedList isKindOfClass:[NSDictionary class]]) {
       [parsedList addObject:[List modelObjectWithDictionary:(NSDictionary *)receivedList]];
    }

    self.list = [NSArray arrayWithArray:parsedList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.info dictionaryRepresentation] forKey:kBaseClassInfo];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.list) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kBaseClassList];

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

    self.info = [aDecoder decodeObjectForKey:kBaseClassInfo];
    self.list = [aDecoder decodeObjectForKey:kBaseClassList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_info forKey:kBaseClassInfo];
    [aCoder encodeObject:_list forKey:kBaseClassList];
}

- (id)copyWithZone:(NSZone *)zone
{
    BaseClass *copy = [[BaseClass alloc] init];
    
    if (copy) {

        copy.info = [self.info copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
