//
//  PhotoDetailTableViewController.h
//  HE Challenge
//
//  Created by Joel Banzatto on 16/06/15.
//  Copyright (c) 2015 Joel Banzatto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoDetailTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIImageView *ownerPhotoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@end
