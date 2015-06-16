//
//  FlickrPhoto.m
//  HE Challenge
//
//  Created by Joel Banzatto on 16/06/15.
//  Copyright (c) 2015 Joel Banzatto. All rights reserved.
//

#import "FlickrPhoto.h"

@implementation FlickrPhoto


#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"identifier": @"id",
             @"owner": @"owner",
             @"secret": @"secret",
             @"server": @"server",
             @"farm": @"farm",
             @"title": @"title"
             };
}

#pragma mark - MTLManagedObjectSerializing

+ (NSString *)managedObjectEntityName {
    return @"Tweet";
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
    return @{};
}

+ (NSSet *)propertyKeysForManagedObjectUniquing {
    return [NSSet setWithObject:@"identifier"];
}

#pragma mark - FlickrPhoto Properties

// https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}_s|m|b.png
- (NSString*) thumbURL {
    return [NSString stringWithFormat:@"https://farm%ldi.staticflickr.com/%ldi/%ldi_%@_s.jpg", (long)_farm.integerValue, (long)_server_id.integerValue, (long)_identifier.integerValue, _secret];
}
- (NSString*) photoURL {
    return [NSString stringWithFormat:@"https://farm%ldi.staticflickr.com/%ldi/%ldi_%@_b.jpg", (long)_farm.integerValue, (long)_server_id.integerValue, (long)_identifier.integerValue, _secret];
}

@end
