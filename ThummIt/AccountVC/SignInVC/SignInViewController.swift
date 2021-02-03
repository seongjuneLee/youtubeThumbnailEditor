//
//  SignInViewController.swift
//  ThummIt
//
//  Created by 이성준 on 2021/01/31.
//

import Foundation
import SwiftUI
import Parse
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import KakaoSDKAuth
import KakaoSDKUser

class SignInViewController: UIViewController {
    @IBOutlet weak var kakaoSignInView: UIView!
    @IBOutlet weak var emailSignInView: UIView!
    @IBOutlet weak var appleSignInView: UIView!
    @IBOutlet weak var googleSignInView: UIView!
    @IBOutlet weak var facebookSignInView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        self.setUpSignInViewcornerRadius()
        
    }
    
    func setUpSignInViewcornerRadius() {
        self.kakaoSignInView.layer.cornerRadius = 5
        self.facebookSignInView.layer.cornerRadius = 5
        self.googleSignInView.layer.cornerRadius = 5
        self.appleSignInView.layer.cornerRadius = 5
        self.emailSignInView.layer.cornerRadius = 5
        
        self.kakaoSignInView.layer.borderWidth = 0.5
        self.facebookSignInView.layer.borderWidth = 0.5
        self.googleSignInView.layer.borderWidth = 0.5
        self.appleSignInView.layer.borderWidth = 0.5
        self.emailSignInView.layer.borderWidth = 0.5

        self.kakaoSignInView.layer.borderColor = UIColor.black.cgColor
        self.facebookSignInView.layer.borderColor = UIColor.black.cgColor
        self.googleSignInView.layer.borderColor = UIColor.black.cgColor
        self.appleSignInView.layer.borderColor = UIColor.black.cgColor
        self.emailSignInView.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        
        
    }
    
    @IBAction func kakaoButtonTapped(_ sender: UIButton) {
        
        if AuthApi.isKakaoTalkLoginAvailable() {
            
            AuthApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                
                
                if let error = error {
                    print("error heree : %@",error)
                } else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                    
                    UserApi.shared.me() {(user, error) in
                        if let error = error {
                            print(error)
                        }
                        else {
                            print("me() success.")

                            //do something
                            _ = user
                            
                            let userID = String(user!.id)
                            let username = user?.properties?["nickname"]
                            let email = user?.kakaoAccount?.email
                            
                            UserManager.sharedInstance().signUp(withThirdPartyID: userID, withType: "kakao", username: username!, withEmail: email!) { (success) in
                                if (success){
                                    self.dismiss(animated: true, completion: nil)
                                } else {
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func facebookButtonTapped(_ sender: UIButton) {
//        FBSDKLoginKit
//        if (AccessToken.hasGranted("public_profile")) {
//            <#code#>
//        }
        
//        if ([[FBSDKAccessToken currentAccessToken] hasGranted:@"email"]) {
//          // TODO: publish content.
//            [FBSDKProfile loadCurrentProfileWithCompletion:
//             ^(FBSDKProfile *profile, NSError *error) {
//               if (profile) {
//                   NSLog(@"Hello, %@!", profile.firstName);
//                   NSLog(@"Hello, profile %@!", profile.name);
//                   NSLog(@"profile.email %@!", profile.email);
//                   NSLog(@"profile.userID %@!", profile.userID);
//    //               NSLog(@"Hello, profile %@!", profile.email);
//    //               NSLog(@"Hello, profile %@!", profile.email);
//               }
//             }];
//        } else {
//          FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
//            [loginManager logInWithPermissions:@[@"public_profile",@"email"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult * _Nullable result, NSError * _Nullable error) {
//                [FBSDKProfile loadCurrentProfileWithCompletion:
//                 ^(FBSDKProfile *profile, NSError *error) {
//                   if (profile) {
//                     NSLog(@"Hello, %@!", profile.firstName);
//                   }
//                 }];
//
//            }];
//        }

        
    }
        
    @IBAction func emailButtonTapped(_ sender: UIButton) {
    }

    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    
    
}
