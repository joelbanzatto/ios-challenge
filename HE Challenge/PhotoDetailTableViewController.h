//
//  PhotoDetailTableViewController.h
//  HE Challenge
//
//  Created by Joel Banzatto on 16/06/15.
//  Copyright (c) 2015 Joel Banzatto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrPhoto.h"
#import "FlickrOwner.h"
#import "CommentsTableViewController.h"

@interface PhotoDetailTableViewController : UITableViewController <CommentsLoadedDelegate>

@property (strong, nonatomic) FlickrPhoto *flickrPhoto;
@property (strong, nonatomic) FlickrPhoto *flickrOwner;

@property (weak, nonatomic) IBOutlet UILabel *lblOwner;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblCommentsCount;
@property (weak, nonatomic) IBOutlet UILabel *lblViewsCount;

@property (weak, nonatomic) IBOutlet UIImageView *ownerPhotoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@property (weak, nonatomic) IBOutlet CommentsTableViewController *commentsViewController;

@end
