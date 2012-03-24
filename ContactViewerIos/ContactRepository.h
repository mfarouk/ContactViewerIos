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

// initializes the singleton instance
+(void)initSingleton;

+(ContactRepository*)singleton;

-(id)initWithCapacity:(NSInteger)capacity;

-(NSInteger)count;

-(void)addContact:(Contact*)contact;

-(void)removeContact:(Contact*)contact;

-(Contact*)contactAtIndex:(NSInteger)index;

@property(strong) NSMutableArray* allContacts;

//-(void)persistContact:(Contact*)contactToSave;

@end
