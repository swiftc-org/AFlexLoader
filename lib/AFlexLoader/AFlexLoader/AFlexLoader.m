//
//  AFlexLoader.m
//  AFlexLoader
//
//  Created by A on 2016/11/11.
//  Copyright © 2016年 A. All rights reserved.
//

#import "AFlexLoader.h"
#import "FLEXManager.h"

@implementation AFlexLoader

 + (instancetype)sharedInstance {
     
     static dispatch_once_t onceToken;
     static AFlexLoader *_sharedInstance;
     dispatch_once(&onceToken, ^{
         _sharedInstance = [[self alloc] init];
     });
     
     return _sharedInstance;
 }

 - (void)showExplorer {
 	 FLEXManager *mgr = [FLEXManager sharedManager];
     [mgr showExplorer];
 }

@end
