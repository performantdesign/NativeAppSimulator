//
//  MockApplicationLauncherViewController.m
//  MockApplicationLauncher
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

#import "MockApplicationLauncherViewController.h"

@implementation MockApplicationLauncherViewController

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (IBAction)getDirectionsTapped {
	NSString *urlToLaunch;

#ifdef DEMO
	urlToLaunch = @"mockmaps://localhost/";
#else
	urlToLaunch = @"http://maps.google.com/maps?saddr=20807+Stevens+Creek+Blvd,+Cupertino,+CA&daddr=22350+Homestead+Rd,+Cupertino,+CA";
#endif

	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlToLaunch]];
}

- (void)dealloc {
    [super dealloc];
}

@end
