//
//  FlickrPhoto.h
//  HE Challenge
//
//  Created by Joel Banzatto on 16/06/15.
//  Copyright (c) 2015 Joel Banzatto. All rights reserved.
//

#import <Mantle/Mantle.h>


@interface FlickrPhotoInfo : MTLModel <MTLJSONSerializing>

@property (copy, nonatomic, readonly) NSNumber *identifier;
@property (copy, nonatomic, readonly) NSString *secret;
@property (copy, nonatomic, readonly) NSNumber *server;
@property (copy, nonatomic, readonly) NSNumber *farm;
@property (copy, nonatomic, readonly) NSString *title;
@property (copy, nonatomic, readonly) NSString *summary;
@property (copy, nonatomic, readonly) NSNumber *views;
@property (copy, nonatomic, readonly) NSNumber *comments;

@property (nonatomic, readonly) NSString *thumbURL;
@property (nonatomic, readonly) NSString *photoURL;

@end
