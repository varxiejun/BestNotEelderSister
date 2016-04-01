//
//  U.h
//
//  Created by   on 16/3/31
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface U : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL isV;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL isVip;
@property (nonatomic, strong) NSArray *header;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
