//
//  Contact.h
//  ContactViewerIos
//
//  Created by ANDY SELVIG on 3/7/12.
//  Copyright (c) 2012 Tiny Mission. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject <NSCoding>

@property(retain) NSString* uuid;
@property(retain) NSString* name;
@property(retain) NSString* phone;
@property(retain) NSString* title;
@property(retain) NSString* email;
@property(retain) NSString* twitterId;

-(id)initWithId:(NSString*)uuid;

@end
