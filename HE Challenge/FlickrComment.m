//
//  FlickrComment.m
//  HE Challenge
//
//  Created by Joel Banzatto on 16/06/15.
//  Copyright (c) 2015 Joel Banzatto. All rights reserved.
//

#import "FlickrComment.h"

@implementation FlickrComment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"authorId": @"author",
             @"authorName": @"authorname",
             @"iconserver": @"iconserver",
             @"iconfarm": @"iconfarm",
             @"comment": @"_content",
             @"datecreate": @"datecreate"
             };
}

- (NSString*) photoURL {
    return [NSString stringWithFormat:@"https://farm%ld.staticflickr.com/%@/buddyicons/%@.jpg", (long)_iconfarm.integerValue, _iconserver, _authorId];
}


- (NSString*) normalizedComment {
    NSRange r;
    NSString *s = self.comment;
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
}

@end
