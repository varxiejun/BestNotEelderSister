//
//  List.h
//
//  Created by   on 16/3/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TopComment, Gif, Image, U, Video;

@interface List : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, strong) NSString *up;
/**
 *  发布时间
 */
@property (nonatomic, strong) NSString *passtime;
@property (nonatomic, strong) TopComment *topComment;
@property (nonatomic, strong) Gif *gif;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) Image *image;
@property (nonatomic, assign) double down;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *shareUrl;
@property (nonatomic, strong) U *u;
@property (nonatomic, strong) NSString *forward;
@property (nonatomic, strong) NSString *bookmark;
@property (nonatomic, strong) Video *video;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
