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

-(void)signUpWithKakaoTalkUserID:(NSString*)thirdPartyID withType:(NSString *)type username:(NSString*)username withEmail:(NSString *)email callback:(void(^)(BOOL)) callback{
    PFQuery* userQuery = PFUser.query;
    NSString* formattedKakaoId = [NSString stringWithFormat:@"%@:%@",type,thirdPartyID];
    [userQuery whereKey:@"thirdPartyUserID" equalTo:formattedKakaoId];
    [userQuery getFirstObjectInBackgroundWithBlock:^(PFObject * _Nullable user, NSError * _Nullable error) {
        if (user) {
            // 서버에 비밀번호 요청 후 로그인
            NSString* fetchedUsername = user[@"username"];
            [PFCloud callFunctionInBackground:@"getUserForUsername" withParameters:@{@"username":fetchedUsername} block:^(PFUser* _Nullable user, NSError * _Nullable error) {
                NSString *password = [NSString randomStringWithLength:10];
                [user setPassword:password];
                [user save];
                [PFUser logInWithUsernameInBackground:fetchedUsername password:password block:^(PFUser * _Nullable user, NSError * _Nullable error) {
                    if (user) {
                        callback(true);
                    }
                }];
            }];
        } else {
            // 새로 가입해야함
            NSString* password = [NSString randomStringWithLength:10];
            PFUser* newUser = [PFUser user];
            [self validatedUserName:username withCompletionBlock:^(NSString *validatedUsername) {
                newUser[@"username"] = validatedUsername;
                newUser[@"password"] = password;
                newUser[@"thirdPartyUserID"] = formattedKakaoId;
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
                NSLog(@"newUser username %@",newUser[@"username"]);
                [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                    if (succeeded) {
                        
                        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * _Nullable user, NSError * _Nullable error) {
                            
                            [NSUserDefaults.standardUserDefaults setObject:user.username forKey:@"username"];
                            PFInstallation *currentInstallation = [PFInstallation currentInstallation];
                            [currentInstallation setObject:user forKey:@"user"];
                            [currentInstallation saveInBackground];
                            
                            callback(succeeded);
                        }];
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

@end
