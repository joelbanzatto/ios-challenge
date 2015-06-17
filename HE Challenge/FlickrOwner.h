//
//  FlickrOwner.h
//  HE Challenge
//
//  Created by Joel Banzatto on 17/06/15.
//  Copyright (c) 2015 Joel Banzatto. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface FlickrOwner : MTLModel <MTLJSONSerializing>

@property (copy, nonatomic, readonly) NSString *identifier;
@property (copy, nonatomic, readonly) NSString *iconserver;
@property (copy, nonatomic, readonly) NSNumber *iconfarm;

@property (nonatomic, readonly) NSString *photoURL;

@end
