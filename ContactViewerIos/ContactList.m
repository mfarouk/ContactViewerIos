//
//  ContactList.m
//  ContactViewerIos
//
//  Created by ANDY SELVIG on 3/7/12.
//  Copyright (c) 2012 Tiny Mission. All rights reserved.
//

#import "ContactList.h"

static ContactList* _singleton = nil;

@implementation ContactList

@synthesize allContacts=_contacts;

NSFileManager *fm;
NSString *data;


-(id)initWithCapacity:(NSInteger)capacity {
    self = [super init];
    _contacts = [[NSMutableArray alloc] initWithCapacity:capacity];
    return self;
}

-(void)persistContact:(Contact*)contactToSave{
    
    
    
    fm = [NSFileManager defaultManager];
    data = @"This is the contents of the file";
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    NSString *docDir = [paths objectAtIndex:0];
    NSString *filePath = [docDir stringByAppendingPathComponent:@"ContactsFile.txt"];
    if([fm fileExistsAtPath:filePath]){
        //Load the file
        /*    [textView setText:[NSString stringwithContectOfFile:filePath encoding:NSUTF8StringEncoding error:nil];*/
    }
    else {
        NSLog(@"File Doesn't Exist");
        [data writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
        
        
    }
}
/*-(void)retrieveContact:(Contact*)contactToLoad{
 fm = [NSFileManager defaultManager];
 if([fm fileExistsAtPath:filePath]){
 //[textView setText:[NSString stringwithContenctof 
 }
 }*/

+(void)initSingleton {
    _singleton = [[ContactList alloc] initWithCapacity:8];
    
    [_singleton addContact:[[Contact alloc] initWithName:@"Malcom Reynolds"
                                                andPhone:@"612-555-1234"
                                                andTitle:@"Captain"
                                                andEmail:@"mal@serenity.com"
                                            andTwitterId:@"malcomreynolds"]];
    [_singleton addContact:[[Contact alloc] initWithName:@"Zoe Washburne"
                                                andPhone:@"612-555-5678"
                                                andTitle:@"First Mate"
                                                andEmail:@"zoe@serenity.com"
                                            andTwitterId:@"zoewashburne"]];
    [_singleton addContact:[[Contact alloc] initWithName:@"Hoban Washburne"
                                                andPhone:@"612-555-9012"
                                                andTitle:@"Pilot"
                                                andEmail:@"wash@serenity.com"
                                            andTwitterId:@"wash"]];
    [_singleton addContact:[[Contact alloc] initWithName:@"Jayne Cobb"
                                                andPhone:@"612-555-1234"
                                                andTitle:@"Muscle"
                                                andEmail:@"jayne@serenity.com"
                                            andTwitterId:@"heroofcanton"]];
    [_singleton addContact:[[Contact alloc] initWithName:@"Kaylee Frye"
                                                andPhone:@"612-555-7890"
                                                andTitle:@"Engineer"
                                                andEmail:@"kaylee@serenity.com"
                                            andTwitterId:@"kaylee"]];
    [_singleton addContact:[[Contact alloc] initWithName:@"Simon Tam"
                                                andPhone:@"612-555-4321"
                                                andTitle:@"Doctor"
                                                andEmail:@"simon@serenity.com"
                                            andTwitterId:@"simontam"]];
    [_singleton addContact:[[Contact alloc] initWithName:@"River Tam"
                                                andPhone:@"612-555-8765"
                                                andTitle:@"Doctor's Sister"
                                                andEmail:@"river@serenity.com"
                                            andTwitterId:@"miranda"]];
    [_singleton addContact:[[Contact alloc] initWithName:@"Shepherd Book"
                                                andPhone:@"612-555-2109"
                                                andTitle:@"Shepherd"
                                                andEmail:@"shepherd@serenity.com"
                                            andTwitterId:@"shepherdbook"]];
}

-(void)addContact:(Contact*)contact {
    [_contacts addObject:contact];
}

-(void)removeContact:(Contact*)contact {
    [_contacts removeObject:contact];
}

-(Contact*)contactAtIndex:(NSInteger)index {
    return [_contacts objectAtIndex:index];
}

+(ContactList*)singleton {
    return _singleton;
}

-(NSInteger)count {
    return [_contacts count];
}

@end
