//
//  AppManager.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/15.
//

#import "AppManager.h"
@import Network;

@implementation AppManager

+ (AppManager *)sharedInstance {
    static AppManager *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AppManager alloc] init];
    });
    
    return sharedInstance;
}

//- (BOOL)connected
//{
//    Reachability *internetReachableFoo = [Reachability reachabilityWithHostname:@"www.google.com"];
//
//    // Internet is reachable
//    internetReachableFoo.reachableBlock = ^(Reachability*reach)
//    {
//        // Update the UI on the main thread
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"Yayyy, we have the interwebs!");
//        });
//    };
//
//    // Internet is not reachable
//    internetReachableFoo.unreachableBlock = ^(Reachability*reach)
//    {
//        // Update the UI on the main thread
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"Someone broke the internet :(");
//        });
//    };
//
//    [internetReachableFoo startNotifier];
//}


@end
