//
//  UIDevice+JBDeviceOwner.m
//  JBDeviceOwner
//
//  Created by Jake Boxer on 4/3/12.
//  Copyright (c) 2012 Jake Boxer. All rights reserved.
//

#import "UIDevice+JBDeviceOwner.h"
#import "JBDeviceOwner.h"

#import <AddressBook/AddressBook.h>

@implementation UIDevice (JBDeviceOwner)

- (JBDeviceOwner *)getOwnerFromAddressBook:(NSError *__autoreleasing *)error
{
    JBDeviceOwner *potentialOwner = [[JBDeviceOwner alloc] initWithDevice:self];
    
    ABAuthorizationStatus authorizationStatus = ABAddressBookGetAuthorizationStatus();
    if (authorizationStatus != kABAuthorizationStatusAuthorized)
    {
        *error = [NSError errorWithDomain:(NSString *)ABAddressBookErrorDomain code:authorizationStatus userInfo:nil];
    }
    
    return potentialOwner;
}

@end
