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
@synthesize nameField = _nameField;
@synthesize titleField = _titleField;
@synthesize phoneField = _phoneField;
@synthesize emailField = _emailField;
@synthesize twitterIdField = _twitterIdField;
@synthesize detailViewController = _detailViewController;
@synthesize editScrollView = _editScrollView;

- (void)viewWillAppear:(BOOL)animated 
{
    [super viewWillAppear:animated];
    if (_contact) {
        _contact = [[ContactRepository singleton] readContact:[_contact uuid]];
        _nameField.text = _contact.name;
        _titleField.text = _contact.title;
        _phoneField.text = _contact.phone;
        _emailField.text = _contact.email;
        _twitterIdField.text = _contact.twitterId;
    }
}

- (void)viewDidLoad {
    [_editScrollView setContentSize:CGSizeMake(320, 600)];
}

- (IBAction)doneButtonPressed:(id)sender 
{
    _contact.name = _nameField.text;
    _contact.title = _titleField.text;
    _contact.phone = _phoneField.text;
    _contact.email = _emailField.text;
    _contact.twitterId = _twitterIdField.text;
    
    if (_contact.name == nil) {
        _contact.name = @"";
    }
    if (_contact.title == nil) {
        _contact.title = @"";
    }
    if (_contact.phone == nil) {
        _contact.phone = @"";
    }
    if (_contact.email == nil) {
        _contact.email = @"";
    }
    if (_contact.twitterId == nil) {
        _contact.twitterId = @"";
    }
    
    [[ContactRepository singleton] updateContact:_contact];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)deleteButtonPressed:(id)sender 
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Delete" 
                                                    message:@"Are you sure you want to delete this contact?" 
                                                   delegate:self 
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex 
{
    if (buttonIndex == 1) {
        // OK clicked
        [[ContactRepository singleton] deleteContact:_contact];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
