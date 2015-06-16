//
//  CommentCell.h
//  HE Challenge
//
//  Created by Joel Banzatto on 16/06/15.
//  Copyright (c) 2015 Joel Banzatto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrComment.h"

@interface CommentCell : UITableViewCell


@property (nonatomic, weak) IBOutlet UILabel *lblName;
@property (nonatomic, weak) IBOutlet UILabel *lblComment;
@property (nonatomic, weak) IBOutlet UIImageView *ivPhoto;

- (void) configureComment: (FlickrComment*) comment;

@end
