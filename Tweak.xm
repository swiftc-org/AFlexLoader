// FELEX Loader for jailbreak device to inject into other app
// copy from DKFLEXLoader

#import <dlfcn.h>
#import <UIKit/UIKit.h>
#import "lib/AFlexLoader.h"

%ctor {

	NSDictionary *preferences = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/me.abit.AFlexLoader.plist"];
	NSString *bundleID = [[NSBundle mainBundle] bundleIdentifier];
	NSString *loaderEnabledKey = [NSString stringWithFormat:@"AFlexLoaderEnabled-%@", bundleID];
	if ([preferences[loaderEnabledKey] boolValue]) {
		//dlopen([dylibPath UTF8String], RTLD_NOW);
		[[NSNotificationCenter defaultCenter] addObserver:[AFlexLoader sharedInstance] selector:@selector(showExplorer) name:UIApplicationDidBecomeActiveNotification object:nil];
		NSLog(@"AFlexLoader: injected successfully");
	} else {
		NSLog(@"AFlexLoader: disabled");
	}

	// NSString *dylibPath = @"/Library/Application Support/AFlexLoader/libflex.dylib";

	// if (![[NSFileManager defaultManager] fileExistsAtPath:dylibPath]) {
	// 	NSLog(@"AFlexLoader: library does not exists at path: %@", dylibPath);
	// } else {
	// 	NSLog(@"AFlexLoader: library found at path: %@", dylibPath);
	// }

	// NSString *bundleID = [[NSBundle mainBundle] bundleIdentifier];
	// NSString *loaderEnabledKey = [NSString stringWithFormat:@"AFlexLoaderEnabled-%@", bundleID];
	// if ([preferences[loaderEnabledKey] boolValue]) {
	// 	dlopen([dylibPath UTF8String], RTLD_NOW);
	// 	NSLog(@"AFlexLoader: injected successfully");
	// } else {
	// 	NSLog(@"AFlexLoader: disabled");
	// }

	// [[NSNotificationCenter defaultCenter] addObserver:[AFlexLoader sharedInstance] selector:@selector(showExplorer) name:UIApplicationDidBecomeActiveNotification object:nil];
}