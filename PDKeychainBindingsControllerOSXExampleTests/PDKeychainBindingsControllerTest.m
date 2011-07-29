//
//  PDKeychainBindingsControllerTest.m
//  PDKeychainBindingsController
//
//  Created by Carl Brown on 7/10/11.
//  Copyright 2011 PDAgent, LLC. All rights reserved.
//

#import "PDKeychainBindingsControllerTest.h"
#import "PDKeychainBindingsController.h"
#import "TestContainerClass.h"

@implementation PDKeychainBindingsControllerTest

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testStandardBindingsExists
{
    STAssertNotNil([PDKeychainBindingsController sharedKeychainBindingsController], @"PDKeychainBindingsController sharedKeychainBindingsController was nil!!");
}

- (void)testStandardBindingsControllerSetRetrieval
{
    //Pull the PDKeychainBindingsController into a local variable just so we can look at it in the debugger if we want to see what's going on
    PDKeychainBindingsController *controller = [PDKeychainBindingsController sharedKeychainBindingsController];
    [controller setValue:@"bar" forKeyPath:[NSString stringWithFormat:@"values.%@",@"myTestString"]];

    NSObject *currentValue = [controller valueForKeyPath:[NSString stringWithFormat:@"values.%@",@"myTestString"]];
    STAssertNotNil(currentValue, @"could not get value back");
    //Now make sure it got set correctly
    STAssertNotNil([[PDKeychainBindings sharedKeychainBindings] objectForKey:@"myTestString"], @"PDKeychainBindings sharedKeychainBindings object for myTestString was nil!!");
    STAssertEquals(@"bar", [[PDKeychainBindings sharedKeychainBindings] objectForKey:@"myTestString"], @"Did not retrieve object correctly");
    
}

/*
 Commenting these out, because bindings, although seemingly working in the UI, aren't working inside the unit tests.

- (void)testStandardDefaultsWillBind
{
    
    //This tests shows how to bind NSUserDefaults the way the next test binds our new object

    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"myTestString"];
    
    TestContainerClass *testContainer = [[TestContainerClass alloc] init];
    [testContainer bind:@"value"
               toObject:[NSUserDefaultsController sharedUserDefaultsController]
            withKeyPath:[NSString stringWithFormat:@"values.%@",@"myTestString"]
                options:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES]
                                                    forKey:@"NSContinuouslyUpdatesValue"]];

    [testContainer setValue:@"foo" forKey:@"value"];
    
    NSUserDefaultsController *controller = [NSUserDefaultsController sharedUserDefaultsController];

    NSObject *currentValue = [controller valueForKeyPath:[NSString stringWithFormat:@"values.%@",@"myTestString"]];
    STAssertNotNil(currentValue, @"could not get value back");
    //Now make sure it got set correctly
    STAssertNotNil([[NSUserDefaults standardUserDefaults] objectForKey:@"myTestString"], @"PDKeychainBindings sharedKeychainBindings object for myTestString was nil!!");
    STAssertEquals(@"foo", [[NSUserDefaults standardUserDefaults] objectForKey:@"myTestString"], @"Did not retrieve object correctly");
    
}


- (void)testStandardBindingsWillBind
{
 
    //Pull the PDKeychainBindingsController into a local variable just so we can look at it in the debugger if we want to see what's going on
    PDKeychainBindingsController *controller = [PDKeychainBindingsController sharedKeychainBindingsController];

    //Erase it first
    [controller setValue:nil forKeyPath:[NSString stringWithFormat:@"values.%@",@"myTestString"]];

    TestContainerClass *testContainer = [[TestContainerClass alloc] init];
    [testContainer bind:@"value"
               toObject:[PDKeychainBindingsController sharedKeychainBindingsController]
            withKeyPath:[NSString stringWithFormat:@"values.%@",@"myTestString"]
                options:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES]
                                                    forKey:@"NSContinuouslyUpdatesValue"]];
    
    [testContainer setValue:@"foo" forKey:@"value"];
    
    //Now make sure it got set correctly
    STAssertNotNil([[PDKeychainBindings sharedKeychainBindings] objectForKey:@"myTestString"], @"PDKeychainBindings sharedKeychainBindings object for myTestString was nil!!");
    STAssertEquals(@"foo", [[PDKeychainBindings sharedKeychainBindings] objectForKey:@"myTestString"], @"Did not retrieve object correctly");
    
}

*/

@end
