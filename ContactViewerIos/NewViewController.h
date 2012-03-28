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
#import "ContactRepository.h"

@interface NewViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITextField* nameField;
@property (strong, nonatomic) IBOutlet UITextField* titleField;
@property (strong, nonatomic) IBOutlet UITextField* emailField;
@property (strong, nonatomic) IBOutlet UITextField* phoneField;
@property (strong, nonatomic) IBOutlet UITextField* twitterIdField;

@property (strong, nonatomic) IBOutlet UIScrollView* scrollView;

-(IBAction)onDone:(id)sender;

-(IBAction)onCancel:(id)sender;

@end
