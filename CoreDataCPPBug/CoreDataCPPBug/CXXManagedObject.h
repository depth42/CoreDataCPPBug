//
//  CXXManagedObject.h
//  CoreDataCPPBug
//
//  Created by Frank Illenberger on 24.04.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "CXXTester.h"

@interface CXXManagedObject : NSManagedObject
{
    CXXTester _tester;
}

- (BOOL)hasConstructorBeenCalled;
@end
