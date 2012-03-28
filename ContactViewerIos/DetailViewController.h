//
//  DetailViewController.h
//  ContactViewerIos
//
//  Created by ANDY SELVIG on 3/7/12.
//  Copyright (c) 2012 Tiny Mission. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
#import "ContactRepository.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) Contact* contact;

@property (strong, nonatomic) IBOutlet UIScrollView* detailScrollView;

@property (strong, nonatomic) IBOutlet UILabel* detailNameField;
@property (strong, nonatomic) IBOutlet UILabel* detailTitleField;
@property (strong, nonatomic) IBOutlet UILabel* detailEmailField;
@property (strong, nonatomic) IBOutlet UILabel* detailPhoneField;
@property (strong, nonatomic) IBOutlet UILabel* detailTwitterIdField;

- (IBAction)onEditContact:(id)sender;

@end