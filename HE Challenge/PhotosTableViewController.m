//
//  PhotosTableViewController.m
//  HE Challenge
//
//  Created by Joel Banzatto on 16/06/15.
//  Copyright (c) 2015 Joel Banzatto. All rights reserved.
//

#import "PhotosTableViewController.h"
#import "FlickrCell.h"
#import "FlickrPhoto.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <QuartzCore/QuartzCore.h>
#import "PhotoDetailTableViewController.h"

@interface PhotosTableViewController ()

@property (nonatomic) bool loading;
@property (nonatomic) NSInteger page;
@property (nonatomic) NSInteger perPage;
@property (nonatomic) NSInteger maxRows;

@property (strong, nonatomic) NSMutableArray *photos;

@end

@implementation PhotosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.clearsSelectionOnViewWillAppear = YES;
    
    self.perPage = 100;
    self.maxRows = 1000;

    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
    
    [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    
    [self refreshTable];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void) refreshTable {
    
    self.loading = YES;
    self.page = 1;
    
    [self refreshTable: self.page];
}

- (void) refreshTable: (NSInteger) page {
    
    if (self.loading && page > 1) return;
    
    if (self.photos.count >= self.maxRows) {
        self.loading = NO;
        return;
    }
    
    self.loading = YES;
    
    if (page > 1)
    {
        [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    }
    
    NSDictionary *params = @{
                             @"method": @"flickr.photos.getRecent",
                             @"format": @"json",
                             @"api_key": @"d08df37395527773cff6e2d3ad82b50e",
                             @"nojsoncallback": @"?",
                             @"page": [NSNumber numberWithInteger:page],
                             @"extras": @"owner_name,views"
                             };
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://www.flickr.com/services/rest/" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {


        self.maxRows = [(NSNumber*)[responseObject valueForKeyPath:@"photos.total"] integerValue];
        self.perPage = [(NSNumber*)[responseObject valueForKeyPath:@"photos.perpage"] integerValue];
        NSArray *photos = (NSArray*) [responseObject valueForKeyPath:@"photos.photo"];
        
        
        [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
        [self.refreshControl endRefreshing];
        
        if (page <= 1)
        {
            self.photos = [NSMutableArray array];
        }
        
        for (NSDictionary *photo in photos)
        {
            FlickrPhoto *flickrPhoto = [MTLJSONAdapter modelOfClass:[FlickrPhoto class] fromJSONDictionary:photo error:nil];
            [self.photos addObject:flickrPhoto];
        }
        
        [self.tableView reloadData];

        self.page = page;
        
        self.loading = NO;
        
        NSLog(@"Refreshing page %ldi", (long)page);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.photos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FlickrCell *cell = (FlickrCell*) [tableView dequeueReusableCellWithIdentifier:@"FlickrCell" forIndexPath:indexPath];
    
    FlickrPhoto *photo = [self.photos objectAtIndex:indexPath.row];

    
    cell.lblTitle.text = photo.title;
    cell.lblAuthor.text = photo.ownername;
    [cell.photoImageView setImageWithURL:[NSURL URLWithString:photo.thumbURL] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    
    return cell;
}

#pragma mark - View Delegates

- (void)scrollViewDidScroll: (UIScrollView *)scroll {
    // UITableView only moves in one direction, y axis
    CGFloat currentOffset = scroll.contentOffset.y;
    CGFloat maximumOffset = scroll.contentSize.height - scroll.frame.size.height;
    
    // Change 10.0 to adjust the distance from bottom
    if (maximumOffset - currentOffset <= 0.0) {
        
        if (!self.loading) {
            [self refreshTable: self.page+1];
        }
    }
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"PhotoDetailSegue"])
    {
        PhotoDetailTableViewController *destinationController = (PhotoDetailTableViewController*) segue.destinationViewController;
        
        
        destinationController.flickrPhoto = [self.photos objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    }
}

@end
