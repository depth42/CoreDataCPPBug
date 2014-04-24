CoreDataCPPBug
==============

Demo project demonstrating the bug that subclasses of NSManagedObject do not call constructors for C++ ivars.

rdar://16712176

Affects CoreData/Cocoa

Summary:
Subclasses of NSManagedObject do not call constructors for C++ ivars.

Steps to reproduce:
 - Build and run the project "CoreDataCppBug" with Xcode under MacOS 10.9
 - Check the console output

Expected results:
The program should exit without any output

Actual result:
The program outputs an assertion failure:
*** Assertion failure in int main(int, const char **)(), CoreDataCPPBug/main.mm:43
*** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Constructor has not been called.'
