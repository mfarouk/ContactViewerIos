//
//  EditViewController.m
//  ContactViewerIos
//
//  Created by User on 3/20/12.
//  Copyright (c) 2012 Tiny Mission. All rights reserved.
//

#import "NewViewController.h"

@implementation NewViewController

@synthesize nameField = _nameField;
@synthesize titleField = _titleField;
@synthesize phoneField = _phoneField;
@synthesize emailField = _emailField;
@synthesize twitterIdField = _twitterIdField;
@synthesize scrollView = _scrollView;

- (void)viewDidLoad {
    [_scrollView setContentSize:CGSizeMake(320, 550)];
}

-(IBAction)onDone:(id)sender 
{
    Contact* newContact = [[ContactRepository singleton] createContact];
    newContact.name = _nameField.text;
    newContact.title = _titleField.text;
    newContact.phone = _phoneField.text;
    newContact.email = _emailField.text;
    newContact.twitterId = _twitterIdField.text;
    
    if (newContact.name == nil) {
        newContact.name = @"";
    }
    if (newContact.title == nil) {
        newContact.title = @"";
    }
    if (newContact.phone == nil) {
        newContact.phone = @"";
    }
    if (newContact.email == nil) {
        newContact.email = @"";
    }
    if (newContact.twitterId == nil) {
        newContact.twitterId = @"";
    }
    
    [[ContactRepository singleton] updateContact:newContact];
    
    _nameField.text = nil;
    _titleField.text = nil;
    _phoneField.text = nil;
    _emailField.text = nil;
    _twitterIdField.text = nil;
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)onCancel:(id)sender
{
    _nameField.text = nil;
    _titleField.text = nil;
    _phoneField.text = nil;
    _emailField.text = nil;
    _twitterIdField.text = nil;
    
    [self.navigationController popViewControllerAnimated:YES];   
}

@end
