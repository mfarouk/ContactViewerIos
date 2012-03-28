//
//  MasterViewController.m
//  ContactViewerIos
//
//  Created by ANDY SELVIG on 3/7/12.
//  Copyright (c) 2012 Tiny Mission. All rights reserved.
//

#import "MasterViewController.h"

@implementation MasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize nwViewController = _nwViewController;

static NSString* CONTACT_CELL_ID = @"CONTACT_CELL_ID";

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    _detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)viewWillAppear:(BOOL)animated 
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table View Data Source

-(int)numberOfSectionsInTableView:(UITableView*)tableView 
{
    return 1;
}

-(int)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section 
{
    return [[[ContactRepository singleton] database] count];
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath 
{
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CONTACT_CELL_ID];
    Contact* contact = [[[ContactRepository singleton] sortedContacts] objectAtIndex:[indexPath row]];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CONTACT_CELL_ID];
	}
    
    cell.textLabel.text = [contact name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@            %@", [contact phone], [contact title]];
    
    return cell;
}


-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath 
{
    if (_detailViewController == nil) {
        _detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Detail"];
    }
    
    Contact* selectedContact = [[[ContactRepository singleton] sortedContacts] objectAtIndex:[indexPath row]];
    _detailViewController.contact = [[ContactRepository singleton] readContact:[selectedContact uuid]];
    [self.navigationController pushViewController:_detailViewController animated:YES];
}

#pragma mark - Outlets

-(IBAction)onNewContact:(id)sender 
{
    if (_nwViewController == nil) {
        _nwViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"New"];
    }
    
    [self.navigationController pushViewController:_nwViewController animated:YES];
}

@end
