//
//  CommentsTableViewController.h
//  HE Challenge
//
//  Created by Joel Banzatto on 16/06/15.
//  Copyright (c) 2015 Joel Banzatto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrPhoto.h"

@protocol CommentsLoadedDelegate <NSObject>

- (void) didLoadedComments: (NSArray*) comments;

@end


@interface CommentsTableViewController : UITableViewController

@property (strong, nonatomic) FlickrPhoto *flickrPhoto;
@property (assign, nonatomic) id<CommentsLoadedDelegate> delegate;

@end
