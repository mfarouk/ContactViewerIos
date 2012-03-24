//
//  DetailViewController.m
//  ContactViewerIos
//
//  Created by ANDY SELVIG on 3/7/12.
//  Copyright (c) 2012 Tiny Mission. All rights reserved.
//

#import "DetailViewController.h"
#import "EditViewController.h"


@implementation DetailViewController
@synthesize detailItem_name = _detailItem_name;
@synthesize detailItem_title = _detailItem_title;
@synthesize detailItem_email = _detailItem_email;
@synthesize detailItem_phone = _detailItem_phone;
@synthesize detailItem_twitterId = _detailItem_twitterId;


@synthesize detailDescriptionLabel_name = _detailDescriptionLabel_name;
@synthesize detailDescriptionLabel_title = _detailDescriptionLabel_title;
@synthesize detailDescriptionLabel_email = _detailDescriptionLabel_email;
@synthesize detailDescriptionLabel_phone = _detailDescriptionLabel_phone;
@synthesize detailDescriptionLabel_twitterId = _detailDescriptionLabel_twitterId;


@synthesize contact = _contact;

#pragma mark - Managing the detail item
- (void)setDetailItem_name:(id)newDetailItem
{
    if (_detailItem_name != newDetailItem) {
        _detailItem_name = newDetailItem;        
    }
}

- (void)setDetailItem_title:(id)newDetailItem
{
    if (_detailItem_title != newDetailItem) {
        _detailItem_title = newDetailItem;        
    }
}

- (void)setDetailItem_email:(id)newDetailItem
{
    if (_detailItem_phone != newDetailItem){
        _detailItem_phone = newDetailItem;
    
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (IBAction)EditButton:(id)sender {
    
    EditViewController *tempView = [self.storyboard instantiateViewControllerWithIdentifier:@"Edit"];
    
    [tempView setContact:self.contact];
    
    [self.navigationController pushViewController:tempView animated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_contact) {
        
        self.detailDescriptionLabel_name.text = _contact.name;
        self.detailDescriptionLabel_title.text = _contact.title;
        self.detailDescriptionLabel_email.text = _contact.email;
        self.detailDescriptionLabel_phone.text = _contact.phone;
        self.detailDescriptionLabel_twitterId.text = _contact.twitterId;
        
    }
}

/*- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}*/

/* (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}*/

/*- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}*/

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];

}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];

}


@end
