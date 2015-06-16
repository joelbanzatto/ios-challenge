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

static NSString * const CellIdentifier = @"CommentCell";


@interface CommentsTableViewController ()

@end

@implementation CommentsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self heightForBasicCellAtIndexPath:indexPath];
}

- (CGFloat)heightForBasicCellAtIndexPath:(NSIndexPath *)indexPath {
    static CommentCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingCell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    });
    
    [self configureBasicCell:sizingCell atIndexPath:indexPath];
    return [self calculateHeightForConfiguredSizingCell:sizingCell];
}

- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell {
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height + 1.0f; // Add 1.0f for the cell separator height
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self basicCellAtIndexPath:indexPath];
}

- (CommentCell *)basicCellAtIndexPath:(NSIndexPath *)indexPath {
    CommentCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    [self configureBasicCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureBasicCell:(CommentCell *)cell atIndexPath:(NSIndexPath *)indexPath {

    cell.lblComment.text = @"Nulla vitae nisl tellus. Nulla pharetra dui vel libero interdum, sed congue mi pellentesque. Nunc at consectetur urna, sagittis egestas enim. Etiam laoreet est sed dolor tempor, vel dictum elit ultricies. Nulla at augue sit amet erat sagittis blandit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ut mauris sed risus lacinia mollis eu in tortor. Donec blandit lectus elit, vitae porttitor eros viverra ac. Ut at dui purus. Quisque est mauris, elementum in leo id, pellentesque lacinia felis. Fusce sollicitudin nulla eu urna placerat, non ullamcorper orci sollicitudin. Cras ut urna ac eros fermentum tincidunt. Donec lobortis massa odio, ut pulvinar est ullamcorper sed.";
    
}

- (void)setTitleForCell:(CommentCell *)cell item:(FlickrComment *)item {
    NSString *title = item.author ?: NSLocalizedString(@"[No Title]", nil);
    [cell.lblName setText:title];
}

- (void)setSubtitleForCell:(CommentCell *)cell item:(FlickrComment *)item {
    NSString *subtitle = item.comment;
    
    [cell.lblComment setText:subtitle];
}

@end
