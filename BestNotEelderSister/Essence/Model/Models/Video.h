//
//  Video.h
//
//  Created by   on 16/3/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Video : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *thumbnail;
@property (nonatomic, assign) double height;
@property (nonatomic, strong) NSArray *download;
@property (nonatomic, assign) double width;
@property (nonatomic, assign) double playfcount;
@property (nonatomic, assign) double duration;
@property (nonatomic, strong) NSArray *video;
@property (nonatomic, assign) double playcount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
