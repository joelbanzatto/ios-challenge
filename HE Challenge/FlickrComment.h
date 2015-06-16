//
//  FlickrComment.h
//  HE Challenge
//
//  Created by Joel Banzatto on 16/06/15.
//  Copyright (c) 2015 Joel Banzatto. All rights reserved.
//

#import "MTLModel.h"

@interface FlickrComment : MTLModel

@property (copy, nonatomic, readonly) NSString *comment;
@property (copy, nonatomic, readonly) NSString *author;

@end
