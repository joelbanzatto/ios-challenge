//
//  FlickrPhoto.m
//  HE Challenge
//
//  Created by Joel Banzatto on 16/06/15.
//  Copyright (c) 2015 Joel Banzatto. All rights reserved.
//

#import "FlickrPhotoInfo.h"

@implementation FlickrPhotoInfo


#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"identifier":@"id",
             @"secret":@"secret",
             @"server":@"server",
             @"farm":@"farm",
             @"title":@"title",
             @"summary":@"summary",
             @"views":@"views",
             @"comments":@"comments._content",
             };
}

#pragma mark - MTLManagedObjectSerializing

+ (NSDictionary *)managedObjectKeysByPropertyKey {
    return @{};
}

+ (NSSet *)propertyKeysForManagedObjectUniquing {
    return [NSSet setWithObject:@"identifier"];
}


#pragma mark - FlickrPhoto Properties


- (NSString*) thumbURL {
    return [NSString stringWithFormat:@"https://farm%ld.staticflickr.com/%ld/%ld_%@_s.jpg", (long)_farm.integerValue, (long)_server.integerValue, (long)_identifier.integerValue, _secret];
}

- (NSString*) photoURL {
    return [NSString stringWithFormat:@"https://farm%ld.staticflickr.com/%ld/%ld_%@_m.jpg", (long)_farm.integerValue, (long)_server.integerValue, (long)_identifier.integerValue, _secret];
}

@end
