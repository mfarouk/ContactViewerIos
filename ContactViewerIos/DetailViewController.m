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

@synthesize detailNameField = _detailNameField;
@synthesize detailTitleField = _detailTitleField;
@synthesize detailEmailField = _detailEmailField;
@synthesize detailPhoneField = _detailPhoneField;
@synthesize detailTwitterIdField = _detailTwitterIdField;
@synthesize detailScrollView = _detailScrollView;
@synthesize contact = _contact;

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
        _detailNameField.text = _contact.name;
        _detailTitleField.text = _contact.title;
        _detailEmailField.text = _contact.email;
        _detailPhoneField.text = _contact.phone;
        _detailTwitterIdField.text = _contact.twitterId;
    }
}

- (IBAction)onEditContact:(id)sender 
{
    EditViewController* editViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Edit"];
    [editViewController setContact:_contact];
    [self.navigationController pushViewController:editViewController animated:YES];
}


@end
