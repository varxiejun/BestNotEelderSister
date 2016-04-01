//
//  Info.m
//
//  Created by   on 16/3/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Info.h"


NSString *const kInfoCount = @"count";
NSString *const kInfoNp = @"np";


@interface Info ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Info

@synthesize count = _count;
@synthesize np = _np;


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
            self.count = [[self objectOrNilForKey:kInfoCount fromDictionary:dict] doubleValue];
            self.np = [[self objectOrNilForKey:kInfoNp fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kInfoCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.np] forKey:kInfoNp];

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

    self.count = [aDecoder decodeDoubleForKey:kInfoCount];
    self.np = [aDecoder decodeDoubleForKey:kInfoNp];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_count forKey:kInfoCount];
    [aCoder encodeDouble:_np forKey:kInfoNp];
}

- (id)copyWithZone:(NSZone *)zone
{
    Info *copy = [[Info alloc] init];
    
    if (copy) {

        copy.count = self.count;
        copy.np = self.np;
    }
    
    return copy;
}


@end
