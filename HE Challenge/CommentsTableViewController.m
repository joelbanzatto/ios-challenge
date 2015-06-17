//
//  CommentsTableViewController.m
//  HE Challenge
//
//  Created by Joel Banzatto on 16/06/15.
//  Copyright (c) 2015 Joel Banzatto. All rights reserved.
//

#import "CommentsTableViewController.h"
#import "FlickrComment.h"
#import "CommentCell.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/UIImageView+AFNetworking.h>

static NSString * const CellIdentifier = @"CommentCell";


@interface CommentsTableViewController ()

@property (strong, nonatomic) NSMutableArray *comments;

@end

@implementation CommentsTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    
    NSDictionary *params = @{
                             @"method": @"flickr.photos.comments.getList",
                             @"format": @"json",
                             @"api_key": @"d08df37395527773cff6e2d3ad82b50e",
                             @"nojsoncallback": @"?",
                             @"photo_id": self.flickrPhoto.identifier
                             };
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://www.flickr.com/services/rest/" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *comments = (NSArray*) [responseObject valueForKeyPath:@"comments.comment"];
        
        self.comments = [NSMutableArray array];
        
        for (NSDictionary *comment in comments) {
            
            FlickrComment *flickrComment = [MTLJSONAdapter modelOfClass:[FlickrComment class] fromJSONDictionary:comment error:nil];
            
            [self.comments addObject:flickrComment];
        }
        
        if ([self.delegate respondsToSelector:@selector(didLoadedComments:)]) {
            [self.delegate didLoadedComments:self.comments];
        }
        
        [self.tableView reloadData];
        
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
    return self.comments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommentCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    FlickrComment *comment = [self.comments objectAtIndex:indexPath.row];
    
    cell.lblComment.text = comment.normalizedComment;
    cell.lblName.text = comment.authorName;
    
    [cell.ivPhoto setImageWithURL:[NSURL URLWithString:comment.photoURL] placeholderImage:[UIImage imageNamed:@"person"]];
    
    return cell;
}

@end
