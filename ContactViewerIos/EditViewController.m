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

- (IBAction)DoneButton:(id)sender {
    NSString *uuid = [[NSProcessInfo processInfo] globallyUniqueString];
    NSLog(@"The Unique ID is %@", uuid);
    /* EditViewController *tempView = [self.storyboard instantiateViewControllerWithIdentifier:@"Edit"];
     [tempView setContact:self.contact];*/
    //[self.navigationController pushViewController:tempView animated:YES];
}

@end
