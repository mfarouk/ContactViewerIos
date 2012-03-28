//
//  EditViewController.h
//  ContactViewerIos
//
//  Created by User on 3/20/12.
//  Copyright (c) 2012 Tiny Mission. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
#import "DetailViewController.h"

@interface EditViewController : UIViewController <UISplitViewControllerDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) Contact* contact;

@property (strong, nonatomic) DetailViewController* detailViewController;

@property (strong, nonatomic) IBOutlet UITextField* nameField;
@property (strong, nonatomic) IBOutlet UITextField* titleField;
@property (strong, nonatomic) IBOutlet UITextField* emailField;
@property (strong, nonatomic) IBOutlet UITextField* phoneField;
@property (strong, nonatomic) IBOutlet UITextField* twitterIdField;

@property (strong, nonatomic) IBOutlet UIScrollView* editScrollView;

-(IBAction)doneButtonPressed:(id)sender;

-(IBAction)deleteButtonPressed:(id)sender;

@end
