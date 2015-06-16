//
//  FlickrClient.m
//  HE Challenge
//
//  Created by Joel Banzatto on 16/06/15.
//  Copyright (c) 2015 Joel Banzatto. All rights reserved.
//

#import "FlickrClient.h"
#import "FlickrPhoto.h"

@implementation FlickrClient


+ (NSDictionary *)modelClassesByResourcePath; {
    return @{
             @"https://www.flickr.com/services/rest/?method=flickr.photos.getRecent": [FlickrPhoto class],
             };
}

@end
