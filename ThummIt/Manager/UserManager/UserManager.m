//
//  UserManager.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/31.
//

#import "UserManager.h"
@import Parse;
#import "NSString+Additions.h"
@implementation UserManager

+ (UserManager *)sharedInstance {
    static UserManager *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[UserManager alloc] init];
    });
    
    return sharedInstance;
}

-(void)signUpWithThirdPartyID:(NSString*)thirdPartyID withType:(NSString *)type username:(NSString*)username withEmail:(NSString *)email callback:(void(^)(BOOL)) callback{
    PFQuery* userQuery = PFUser.query;
    NSString* formattedId = [NSString stringWithFormat:@"%@:%@",type,thirdPartyID];
    [userQuery whereKey:@"thirdPartyUserID" equalTo:formattedId];
    [userQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        PFUser *user = (PFUser *)objects.firstObject;
        if (user) {
            [user fetchIfNeededInBackgroundWithBlock:^(PFObject * _Nullable object, NSError * _Nullable error) {
                [PFCloud callFunctionInBackground:@"getPasswordForUsername" withParameters:@{@"username":user.username} block:^(NSString* _Nullable newPassword, NSError * _Nullable error) {
                    [PFUser logInWithUsernameInBackground:user.username password:newPassword block:^(PFUser * _Nullable user, NSError * _Nullable error) {
                        if (user) {
                            callback(true);
                        } else{
                            callback(false);
                        }
                    }];
                }];
            }];
            
        } else {
            NSString* password = [NSString randomStringWithLength:10];
            PFUser* newUser = [PFUser user];
            [self validatedUserName:username withCompletionBlock:^(NSString *validatedUsername) {
                newUser[@"username"] = validatedUsername;
                newUser[@"nickname"] = validatedUsername;
                newUser[@"password"] = password;
                newUser[@"thirdPartyUserID"] = formattedId;
                newUser[@"email"] = email;
                
                // 유저에도 언어, 국가 저장해두기 => 푸시노티 메시지 로컬라이즈를 위해
                NSString* language = PFUser.currentUser[@"language"];
                NSString* country = PFUser.currentUser[@"country"];
                if (language.length == 0 || country.length == 0) {
                    NSString *languageCode = [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode];
                    NSString *countryCode = [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];
                    if (languageCode.length) {
                        newUser[@"language"] = languageCode;
                    }
                    if (countryCode.length) {
                        newUser[@"country"] = countryCode;
                    }
                    
                }
                [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                    if (succeeded) {
                        callback(succeeded);
                        
                    } else {
                        callback(false);
                    }
                }];
            }];
        }
    }];
         
}

-(void)validatedUserName:(NSString *)username withCompletionBlock:(void (^)(NSString *validatedUsername))block{
    
    
    [PFCloud callFunctionInBackground:@"validatedUsername" withParameters:@{@"username":username} block:^(NSString* _Nullable validatedUsername, NSError * _Nullable error) {
        
        block(validatedUsername);
        
    }];

}

-(void)startSignUpWithInApp{
    
    self.email = @"";
    self.nickname = @"";
    self.password = @"";
    
}

@end
