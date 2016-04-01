//
//  Image.h
//
//  Created by   on 16/3/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Image : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double height;
@property (nonatomic, strong) NSArray *medium;
@property (nonatomic, assign) double width;
@property (nonatomic, strong) NSArray *big;
@property (nonatomic, strong) NSArray *small;
@property (nonatomic, strong) NSArray *downloadUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
