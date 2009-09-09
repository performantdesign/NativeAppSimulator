//
//  MockMapsViewController.m
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

#import "MockMapsViewController.h"

@implementation MockMapsViewController

@synthesize imageView, demoSequence, currentSequence;

- (IBAction)nextSequence {
	if (self.currentSequence >= [self.demoSequence count]) {
		return;
	}

	NSDictionary *sequence = [self.demoSequence objectAtIndex:self.currentSequence];

	UIImage *image = [UIImage imageNamed:[sequence objectForKey:@"Image"]];
	if (image.size.height == 480.0 && image.size.width == 320.0) {
		// Auto-crop to 320x460 so that we retain the status bar of the simulator
		CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], CGRectMake(0.0, 20.0, 320.0, 460.0));
		[imageView setImage:[UIImage imageWithCGImage:imageRef] forState:UIControlStateNormal];
		CGImageRelease(imageRef);
	}
	else {
		[imageView setImage:image forState:UIControlStateNormal];
	}

	NSTimeInterval delay = [[sequence objectForKey:@"Delay"] doubleValue];
	if (delay > 0) { // a delay of 0 denotes that we will wait for a click before proceeding
		[self performSelector:@selector(nextSequence) withObject:nil afterDelay:delay];
	}

	self.currentSequence = self.currentSequence + 1;
}

- (void)viewDidLoad {
    [super viewDidLoad];

	NSString *demoSequencePlistPath = [[NSBundle mainBundle] pathForResource:@"DemoSequence" ofType:@"plist"];
	NSData *demoSequencePlistData = [[NSFileManager defaultManager] contentsAtPath:demoSequencePlistPath];
	self.demoSequence = [NSPropertyListSerialization propertyListFromData:demoSequencePlistData mutabilityOption:NSPropertyListImmutable 
																   format:NULL errorDescription:NULL];
	self.currentSequence = 0;

	[self nextSequence];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
	[imageView release];
	[demoSequence release];
    
	[super dealloc];
}

@end
