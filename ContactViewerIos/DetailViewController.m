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

#pragma mark - View lifecycle

-(void)viewDidLoad
{
    [super viewDidLoad];
    [_detailScrollView setContentSize:CGSizeMake(320, 800)];
}

- (void)viewWillAppear:(BOOL)animated 
{
    [super viewWillAppear:animated];
    if (_contact) {
        _contact = [[ContactRepository singleton] readContact:[_contact uuid]];
        self.detailNameField.text = _contact.name;
        self.detailTitleField.text = _contact.title;
        self.detailEmailField.text = _contact.email;
        self.detailPhoneField.text = _contact.phone;
        self.detailTwitterIdField.text = _contact.twitterId;
    }
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController*)splitController 
     willHideViewController:(UIViewController*)viewController 
          withBarButtonItem:(UIBarButtonItem*)barButtonItem 
       forPopoverController:(UIPopoverController*)popoverController 
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    
}

#pragma mark - Outlets

- (IBAction)onEditContact:(id)sender 
{
    EditViewController* editViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Edit"];
    [editViewController setContact:_contact];
    [self.navigationController pushViewController:editViewController animated:YES];
}


@end
