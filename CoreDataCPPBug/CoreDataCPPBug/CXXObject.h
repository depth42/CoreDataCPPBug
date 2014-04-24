//
//  CXXObject.h
//  CoreDataCPPBug
//
//  Created by Frank Illenberger on 24.04.14.
//  Copyright (c) 2014 ProjectWizards. All rights reserved.
//

#import "CXXTester.h"

@interface CXXObject : NSObject
{
    CXXTester _tester;
}

- (BOOL)hasConstructorBeenCalled;
@end
