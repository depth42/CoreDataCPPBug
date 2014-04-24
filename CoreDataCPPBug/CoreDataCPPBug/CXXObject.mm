//
//  CXXObject.m
//  CoreDataCPPBug
//
//  Created by Frank Illenberger on 24.04.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import "CXXObject.h"

@implementation CXXObject

- (BOOL)hasConstructorBeenCalled
{
    return _tester.value == 42;
}

@end
