//  CoreDataCPPBug
// Affects CoreData/Cocoa
// Frank Illenberger
// illenberger@projectwizards.net
//
// Summary:
// Subclasses of NSManagedObject do not call constructors for C++ ivars.
//
// Steps to reproduce:
// - Build and run the project "CoreDataCppBug" with Xcode under MacOS 10.9
// - Check the console output
//
// Expected results:
// The program should exit without any output
//
// Actual result:
// The program outputs an assertion failure:
// *** Assertion failure in int main(int, const char **)(), CoreDataCPPBug/main.mm:43
// *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Constructor has not been called.'
//

#import "CXXManagedObject.h"
#import "CXXObject.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        CXXObject* object = [[CXXObject alloc] init];
        NSCAssert(object.hasConstructorBeenCalled, @"Constructor has not been called.");        // This is working fine!

        NSEntityDescription* entity = [[NSEntityDescription alloc] init];
        entity.name = @"CXX";
        entity.managedObjectClassName = @"CXXManagedObject";
        NSManagedObjectModel* model = [[NSManagedObjectModel alloc] init];
        model.entities = @[entity];
        NSPersistentStoreCoordinator* psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
        NSManagedObjectContext* context = [[NSManagedObjectContext alloc] init];
        context.persistentStoreCoordinator = psc;
        CXXManagedObject* managedObject = [NSEntityDescription insertNewObjectForEntityForName:@"CXX"
                                                                        inManagedObjectContext:context];

        NSCAssert(managedObject.hasConstructorBeenCalled, @"Constructor has not been called."); // This does not work as of Mac OS 10.9.2
    }
    return 0;
}
