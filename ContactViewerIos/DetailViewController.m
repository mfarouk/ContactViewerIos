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

@synthesize detailNameField = _detailDescriptionLabel_name;
@synthesize detailTitleField = _detailDescriptionLabel_title;
@synthesize detailEmailField = _detailDescriptionLabel_email;
@synthesize detailPhoneField = _detailDescriptionLabel_phone;
@synthesize detailTwitterIdField = _detailDescriptionLabel_twitterId;

@synthesize detailScrollView = _detailScrollView;

@synthesize contact = _contact;

- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_detailScrollView setContentSize:CGSizeMake(320, 800)];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (IBAction)editButtonPressed:(id)sender 
{
    EditViewController *editViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Edit"];
    [editViewController setContact:self.contact];
    [self.navigationController pushViewController:editViewController animated:YES];
}

- (void)viewWillAppear:(BOOL)animated 
{
    [super viewWillAppear:animated];
    if (_contact) {
        self.detailNameField.text = _contact.name;
        self.detailTitleField.text = _contact.title;
        self.detailEmailField.text = _contact.email;
        self.detailPhoneField.text = _contact.phone;
        self.detailTwitterIdField.text = _contact.twitterId;
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
    } 
    else {
        return YES;
    }
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController 
     willHideViewController:(UIViewController *)viewController 
          withBarButtonItem:(UIBarButtonItem *)barButtonItem 
       forPopoverController:(UIPopoverController *)popoverController 
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
