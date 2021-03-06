//
//  MockMapsAppDelegate.m
//  MockMaps
//
//  Created by Aaron Kardell on 9/8/09.
//  Copyright 2009 Performant Design, LLC.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "MockMapsAppDelegate.h"
#import "MockMapsViewController.h"

@implementation MockMapsAppDelegate

@synthesize window;
@synthesize viewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	// Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
	return YES;
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}

@end
