//
//  DetailViewController.h
//  ContactViewerIos
//
//  Created by ANDY SELVIG on 3/7/12.
//  Copyright (c) 2012 Tiny Mission. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem_name;
@property (strong, nonatomic) id detailItem_title;
@property (strong, nonatomic) id detailItem_email;
@property (strong, nonatomic) id detailItem_phone;
@property (strong, nonatomic) id detailItem_twitterId;

@property (strong, nonatomic) Contact* contact;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel_name;
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel_title;
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel_email;
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel_phone;
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel_twitterId;

- (IBAction)EditButton:(id)sender;



@end