// FELEX Loader for jailbreak device to inject into other app
// copy from DKFLEXLoader

#import <UIKit/UIKit.h>
#import "lib/AFlexLoader.h"

%ctor {

	//NSDictionary *preferences = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/me.abit.AFlexLoader.plist"];
	NSDictionary *preferences = [NSDictionary dictionaryWithContentsOfFile:@"/User/Library/Preferences/me.abit.AFlexLoader.plist"];
	NSString *bundleID = [[NSBundle mainBundle] bundleIdentifier];
	NSString *loaderEnabledKey = [NSString stringWithFormat:@"AFlexLoaderEnabled-%@", bundleID];
	if ([preferences[loaderEnabledKey] boolValue]) {
		[[NSNotificationCenter defaultCenter] addObserver:[AFlexLoader sharedInstance] selector:@selector(showExplorer) name:UIApplicationDidBecomeActiveNotification object:nil];
		NSLog(@"AFlexLoader: injected successfully");
	} else {
		NSLog(@"AFlexLoader: disabled");
	}
}