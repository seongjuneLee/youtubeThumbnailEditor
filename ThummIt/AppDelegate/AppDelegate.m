//
//  AppDelegate.m
//  Thummit
//
//  Created by 이성준 on 2020/12/12.
//

#import "AppDelegate.h"
#import "PhotoManager.h"
#import "ProjectManager.h"
#import "ThummIt-Swift.h"

@import Parse;
@import FirebaseCore;
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [MigratorJul.shared migrateIfNeeded];
    
    [Parse initializeWithConfiguration:[ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration>  _Nonnull configuration) {
        configuration.applicationId = @"myappID";
        configuration.clientKey = @"BcwGJj2vgmdM";
        configuration.server = @"http://3.34.137.65/parse";
    }]];
    
    [FIRApp configure];
    
    for (NSString *family in [UIFont familyNames]) {
        NSLog(@"family names :%@\n",family);
        for (NSString *name in [UIFont fontNamesForFamilyName:family]) {
            NSLog(@"font Name: %@\n",name);
        }
    }
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
