//
//  UserManager.h
//  ThummIt
//
//  Created by 이성준 on 2021/01/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserManager : NSObject


-(void)signUpWithThirdPartyID:(NSString*)thirdPartyID withType:(NSString *)type username:(NSString*)username withEmail:(NSString *)email callback:(void(^)(BOOL)) callback;
+ (UserManager *)sharedInstance;

@end

NS_ASSUME_NONNULL_END
