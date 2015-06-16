//
//  FlickrCell.m
//  HE Challenge
//
//  Created by Joel Banzatto on 16/06/15.
//  Copyright (c) 2015 Joel Banzatto. All rights reserved.
//

#import "FlickrCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation FlickrCell

- (void)awakeFromNib {
    // Initialization code
    
    self.photoImageView.layer.cornerRadius = 8.0f;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
