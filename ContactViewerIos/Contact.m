//
//  Contact.m
//  ContactViewerIos
//
//  Created by ANDY SELVIG on 3/7/12.
//  Copyright (c) 2012 Tiny Mission. All rights reserved.
//

#import "Contact.h"

@implementation Contact

@synthesize uuid = _uuid, 
            name = _name, 
            title = _title,
            email = _email,
            phone = _phone,
            twitterId = _twitterId;

-(id)initWithId:(NSString*)uuid
{    
    self = [super init];
    _uuid = uuid;
    _name = _title = _email = _phone = _twitterId = @"";
    return self;
}

- (NSComparisonResult)compare:(Contact*)otherObject 
{
    return [_name compare:otherObject.name];
}

- (void)encodeWithCoder:(NSCoder*)encoder;
{
    [encoder encodeObject:_uuid forKey:@"uuid"];
    [encoder encodeObject:_name forKey:@"name"];
    [encoder encodeObject:_title forKey:@"title"];
    [encoder encodeObject:_email forKey:@"email"];
    [encoder encodeObject:_phone forKey:@"phone"];
    [encoder encodeObject:_twitterId forKey:@"twitterId"];
}

- (id)initWithCoder:(NSCoder*)decoder;
{
    if (![super init]) {
        return nil;
    }
    
    _uuid = [decoder decodeObjectForKey:@"uuid"];
    _name = [decoder decodeObjectForKey:@"name"];
    _title = [decoder decodeObjectForKey:@"title"];
    _email = [decoder decodeObjectForKey:@"email"];
    _phone = [decoder decodeObjectForKey:@"phone"];
    _twitterId = [decoder decodeObjectForKey:@"twitterId"];
    
    return self;
}

@end
