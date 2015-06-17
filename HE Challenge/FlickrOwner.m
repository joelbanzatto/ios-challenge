//
//  FlickrOwner.m
//  HE Challenge
//
//  Created by Joel Banzatto on 17/06/15.
//  Copyright (c) 2015 Joel Banzatto. All rights reserved.
//

#import "FlickrOwner.h"

@implementation FlickrOwner

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"identifier": @"id",
             @"iconserver": @"iconserver",
             @"iconfarm": @"iconfarm",
             };
}


- (NSString*) photoURL {
    return [NSString stringWithFormat:@"https://farm%ld.staticflickr.com/%@/buddyicons/%@.jpg", (long)_iconfarm.integerValue, _iconserver, _identifier];
}

@end
