//
//  MasterViewController.h
//  ContactViewerIos
//
//  Created by ANDY SELVIG on 3/7/12.
//  Copyright (c) 2012 Tiny Mission. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "NewViewController.h"
#import "Contact.h"
#import "ContactRepository.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController <UITableViewDataSource>

@property (strong, nonatomic) DetailViewController* detailViewController;
@property (strong, nonatomic) NewViewController* nwViewController;

-(IBAction)onNewContact:(id)sender;

@end
