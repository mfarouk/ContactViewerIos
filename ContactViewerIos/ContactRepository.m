//
//  ContactList.m
//  ContactViewerIos
//
//  Created by ANDY SELVIG on 3/7/12.
//  Copyright (c) 2012 Tiny Mission. All rights reserved.
//

#import "ContactRepository.h"

static ContactRepository* _singleton = nil;
static NSString* DATABASE_FILE_PATH = nil;

@implementation ContactRepository

@synthesize database = _database;

+(ContactRepository*)singleton 
{
    if (_singleton == nil) {
        DATABASE_FILE_PATH = [NSString stringWithFormat:@"%@/database.plist", [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]];
        _singleton = [[ContactRepository alloc] init];
    }
    return _singleton;
}

-(id)init
{
    NSData* rawData = [[NSFileManager defaultManager] contentsAtPath:DATABASE_FILE_PATH];
    if (rawData == nil) {
        _database = [[NSMutableDictionary alloc] init];
        [self commit];
    }
    else {
        _database = [NSKeyedUnarchiver unarchiveObjectWithData:rawData];
    }
    return self;
}

-(Contact*)createContact 
{
    NSString* newUuid = [[NSProcessInfo processInfo] globallyUniqueString];
    Contact* newContact = [[Contact alloc] initWithId:newUuid];
    [self updateContact:newContact];
    return newContact;
}

-(Contact*)readContact:(NSString*)uuid 
{
    return [_database objectForKey:uuid];
}

-(void)updateContact:(Contact*)contact 
{
    if (contact != nil) {
        [_database setObject:contact forKey:[contact uuid]];
        [self commit];
    }
}

-(void)deleteContact:(Contact*)contact 
{
    [_database removeObjectForKey:[contact uuid]];
    [self commit];
}

-(void)commit 
{
    NSData* rawData = [NSKeyedArchiver archivedDataWithRootObject:_database];
    BOOL result = [rawData writeToFile:DATABASE_FILE_PATH atomically:YES];
    NSLog(@"Commit: %@", result ? @"YES" : @"NO");
}

-(NSArray*)sortedContacts 
{
    return [[_database allValues] sortedArrayUsingSelector:@selector(compare:)];
}

@end
