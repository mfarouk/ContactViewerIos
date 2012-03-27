//
//  EditViewController.m
//  ContactViewerIos
//
//  Created by User on 3/20/12.
//  Copyright (c) 2012 Tiny Mission. All rights reserved.
//

#import "EditViewController.h"

@implementation EditViewController

@synthesize contact = _contact;
@synthesize nameField;
@synthesize titleField;
@synthesize phoneField;
@synthesize emailField;
@synthesize twitterIdField;
@synthesize detailViewController = _detailViewController;
@synthesize editScrollView = _editScrollView;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (_contact) {
        self.nameField.text = _contact.name;
        self.titleField.text = _contact.title;
        self.phoneField.text = _contact.phone;
        self.emailField.text = _contact.email;
        self.twitterIdField.text = _contact.twitterId;
    }
}

- (void)viewDidLoad {
    [_editScrollView setContentSize:CGSizeMake(320, 600)];
}

- (IBAction)doneButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)deleteButtonPressed:(id)sender {
    
}

@end
