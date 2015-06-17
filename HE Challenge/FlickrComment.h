//
//  FlickrComment.h
//  HE Challenge
//
//  Created by Joel Banzatto on 16/06/15.
//  Copyright (c) 2015 Joel Banzatto. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface FlickrComment : MTLModel<MTLJSONSerializing>

@property (copy, nonatomic, readonly) NSString *comment;
@property (copy, nonatomic, readonly) NSString *authorName;
@property (copy, nonatomic, readonly) NSString *authorId;
@property (copy, nonatomic, readonly) NSString *iconfarm;
@property (copy, nonatomic, readonly) NSString *iconserver;
@property (copy, nonatomic, readonly) NSNumber *datecreate;


- (NSString*) normalizedComment;

@property (nonatomic, readonly) NSString *photoURL;


@end
