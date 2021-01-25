//
//  AccountViewController.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/06.
//

#import "AccountViewController.h"
#import "UILabel+Additions.h"
#import <KakaoOpenSDK/KakaoOpenSDK.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface AccountViewController ()

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSignInWithViewLayer];
    [self addButtonToPrivacyPolicyLabel];
    [self connectAccountTableController];
    
}

-(void)connectAccountTableController{
    self.accountTableController = [[AccountTableController alloc] initWithTableView:self.tableView];
    
    self.accountTableController.accountVC = self;
    [self.accountTableController setAccountVCHeader];
}

-(void)setSignInWithViewLayer{
    
    self.kakaoSignInView.layer.cornerRadius = 5;
    self.facebookSignInView.layer.cornerRadius = 5;
    self.googleSignInView.layer.cornerRadius = 5;
    self.appleSignInView.layer.cornerRadius = 5;
    self.emailSignInView.layer.cornerRadius = 5;
    
    self.kakaoSignInView.layer.borderWidth = 0.5;
    self.facebookSignInView.layer.borderWidth = 0.5;
    self.googleSignInView.layer.borderWidth = 0.5;
    self.appleSignInView.layer.borderWidth = 0.5;
    self.emailSignInView.layer.borderWidth = 0.5;

    self.kakaoSignInView.layer.borderColor = UIColor.blackColor.CGColor;
    self.facebookSignInView.layer.borderColor = UIColor.blackColor.CGColor;
    self.googleSignInView.layer.borderColor = UIColor.blackColor.CGColor;
    self.appleSignInView.layer.borderColor = UIColor.blackColor.CGColor;
    self.emailSignInView.layer.borderColor = UIColor.blackColor.CGColor;
    
}

-(void)addButtonToPrivacyPolicyLabel{
    
    NSString *privacyPolicyLabelText = self.privacyPolicyLabel.text;
    NSRange termsOfUsesRange = [privacyPolicyLabelText rangeOfString:@"terms of uses"];
    
    CGRect termsOfUsesRect = [self.privacyPolicyLabel boundingRectForCharacterRange:termsOfUsesRange];
    UIButton *termsOfUsesButton = [[UIButton alloc]init];
    termsOfUsesButton.frame = termsOfUsesRect;
    termsOfUsesButton.frameY += 1;
//    termsOfUsesButton.backgroundColor = UIColor.blueColor;
//    termsOfUsesButton.alpha = 0.5;
    [termsOfUsesButton addTarget:self action:@selector(termsOfUsesButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.privacyPolicyLabel addSubview:termsOfUsesButton];
    
    NSRange privacyPolicyRange = [privacyPolicyLabelText rangeOfString:@"privacy policy"];
    CGRect privacyPolicyRect = [self.privacyPolicyLabel boundingRectForCharacterRange:privacyPolicyRange];
    UIButton *privacyPolicyButton = [[UIButton alloc]init];
    privacyPolicyButton.frame = privacyPolicyRect;
    privacyPolicyButton.frameY += 1;
//    privacyPolicyButton.backgroundColor = UIColor.redColor;
//    privacyPolicyButton.alpha = 0.5;
    [privacyPolicyButton addTarget:self action:@selector(privacyPolicyButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.privacyPolicyLabel addSubview:privacyPolicyButton];

    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc]initWithAttributedString: self.privacyPolicyLabel.attributedText];
    
    
    [attributedText addAttributes:@{ NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle), NSForegroundColorAttributeName : [UIColor blackColor], NSFontAttributeName : [UIFont fontWithName:@"applesdgothicneo-bold" size:10.0] } range:termsOfUsesRange];
    [attributedText addAttributes:@{ NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle), NSForegroundColorAttributeName : [UIColor blackColor], NSFontAttributeName : [UIFont fontWithName:@"applesdgothicneo-bold" size:10.0]} range:privacyPolicyRange];
    
    [self.privacyPolicyLabel setAttributedText: attributedText];
    
}

-(void)termsOfUsesButtonTouched:(id)sender{
    
    self.signInView.alpha = 0.1; //
    
}

-(void)privacyPolicyButtonTouched:(id)sender{
    
    self.signInView.alpha = 1; //
    
}
//kakao_login


- (IBAction)kakaoSignInButton:(id)sender {
    [[KOSession sharedSession] close];

    [[KOSession sharedSession] openWithCompletionHandler:^(NSError *error) {
        if (error) {
            NSLog(@"login failed. - error: %@", error);
        }
        else {
            NSLog(@"login succeeded.");
        }
    }];
}

//logout button IBAction 작업필요
//[[KOSession sharedSession] logoutAndCloseWithCompletionHandler:^(BOOL success, NSError *error) {
//    if (error) {
//        NSLog(@"failed to logout. - error: %@", error);
//    }
//    else {
//        NSLog(@"logout succeeded.");
//    }
//}];

//연결끊기(logout 후 다시 로그인 화면으로 전환해주기 위함)
//[KOSessionTask unlinkTaskWithCompletionHandler:^(BOOL success, NSError *error) {
//    if (error) {
//        NSLog(@"unlink logout. - error: %@", error);
//    }
//    else {
//        NSLog(@"unlink succeeded.");
//    }
//}];


//facebook_login

- (IBAction)facebookSignInButton:(id)sender {
    
    if ([FBSDKAccessToken currentAccessToken]) {

        // User is logged in, do work such as go to next view controller.
        // 토큰 가지고 페이스북 유저 정보 가져오기.
    }
    else {
        FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
        [login logInWithPermissions: @[@"email"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
            if (error) {
                NSLog(@"Process error");
            } else if(result. isCancelled) {
                NSLog(@"Cancelled");}
            else {
                NSLog(@"Logged in");
                }
        }];
    }
    
}


@end
