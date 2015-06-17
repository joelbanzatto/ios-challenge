//
//  FlickrPhoto.h
//  HE Challenge
//
//  Created by Joel Banzatto on 16/06/15.
//  Copyright (c) 2015 Joel Banzatto. All rights reserved.
//

#import <Mantle/Mantle.h>


@interface FlickrPhoto : MTLModel <MTLJSONSerializing>

@property (copy, nonatomic, readonly) NSNumber *identifier;
@property (copy, nonatomic, readonly) NSString *owner;
@property (copy, nonatomic, readonly) NSString *ownername;
@property (copy, nonatomic, readonly) NSString *secret;
@property (copy, nonatomic, readonly) NSNumber *server_id;
@property (copy, nonatomic, readonly) NSNumber *farm;
@property (copy, nonatomic, readonly) NSString *title;
@property (copy, nonatomic, readonly) NSNumber *views;

@property (nonatomic, readonly) NSString *thumbURL;
@property (nonatomic, readonly) NSString *photoURL;

@end
