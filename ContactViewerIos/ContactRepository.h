//
//  ContactList.h
//  ContactViewerIos
//
//  Created by ANDY SELVIG on 3/7/12.
//  Copyright (c) 2012 Tiny Mission. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactRepository : NSObject

+(ContactRepository*)singleton;

-(Contact*)createContact;

-(Contact*)readContact:(NSString*)uuid;

-(void)updateContact:(Contact*)contact;

-(void)deleteContact:(Contact*)contact;

-(void)commit;

-(NSArray*)sortedContacts;

@property(strong) NSMutableDictionary* database;

@end
