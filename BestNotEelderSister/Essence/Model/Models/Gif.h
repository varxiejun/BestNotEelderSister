//
//  Gif.h
//
//  Created by   on 16/3/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Gif : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSArray *gifThumbnail;
@property (nonatomic, assign) double width;
@property (nonatomic, strong) NSArray *downloadUrl;
@property (nonatomic, assign) double height;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
