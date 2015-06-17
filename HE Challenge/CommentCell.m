//
//  CommentCell.m
//  HE Challenge
//
//  Created by Joel Banzatto on 16/06/15.
//  Copyright (c) 2015 Joel Banzatto. All rights reserved.
//

#import "CommentCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation CommentCell

- (void)awakeFromNib {
    // Initialization code
    
    self.ivPhoto.layer.cornerRadius = self.ivPhoto.frame.size.height / 2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) configureComment: (FlickrComment*) comment {
    
    self.lblName.text = @"asd asdasd";
    self.lblComment.text = @"asd asdasd asdasdad asd sdsssd sssddddlsl sldksldk lskdlskdlksd lskdlsdklsdlksd sldkslkd. dksldkslkdlskdlskdl sldklsdlskd slkd. asudhahsdhas duashd ahusd uahsduha suhd uahsduha suhd .";
    
}

@end
