//
//  PhotoDetailTableViewController.m
//  HE Challenge
//
//  Created by Joel Banzatto on 16/06/15.
//  Copyright (c) 2015 Joel Banzatto. All rights reserved.
//

#import "PhotoDetailTableViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <AFNetworking/AFNetworking.h>

@interface PhotoDetailTableViewController ()

@end

@implementation PhotoDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lblTitle.text = self.flickrPhoto.title;
    self.lblOwner.text = self.flickrPhoto.ownername;
    self.lblViewsCount.text = [NSString stringWithFormat:@"%ld view(s)", self.flickrPhoto.views.integerValue];
    
    
    [self.photoImageView setImageWithURL:[NSURL URLWithString:self.flickrPhoto.photoURL]];
    
    self.ownerPhotoImageView.layer.cornerRadius = 27.0f;
    
    
    // photo info
    NSDictionary *params = @{
                             @"method": @"flickr.photos.getInfo",
                             @"format": @"json",
                             @"api_key": @"d08df37395527773cff6e2d3ad82b50e",
                             @"nojsoncallback": @"?",
                             @"photo_id": self.flickrPhoto.identifier
                             };
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://www.flickr.com/services/rest/" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *photo = (NSDictionary*) [responseObject valueForKey:@"photo"];
        
        self.flickrPhotoInfo = [MTLJSONAdapter modelOfClass:[FlickrPhotoInfo class] fromJSONDictionary:photo error:nil];
        
        self.lblCommentsCount.text = [NSString stringWithFormat:@"%ld comment(s)", self.flickrPhotoInfo.comments.integerValue];
        
        
        NSDictionary *owner = (NSDictionary*) [responseObject valueForKeyPath:@"photo.owner"];
        
        self.flickrOwner = [MTLJSONAdapter modelOfClass:[FlickrOwner class] fromJSONDictionary:owner error:nil];
        
        [self.ownerPhotoImageView setImageWithURL:[NSURL URLWithString:self.flickrOwner.photoURL] placeholderImage:[UIImage imageNamed:@"person"]];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 4;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EmbedCommentsController"]) {
        self.commentsViewController = (CommentsTableViewController*) segue.destinationViewController;
        
        self.commentsViewController.flickrPhoto = self.flickrPhoto;
    }
}

@end
