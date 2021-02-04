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
import FBSDKLoginKit
import FBSDKCoreKit

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
        self.emailSignInView.layer.cornerRadius = 5
        
        self.kakaoSignInView.layer.borderWidth = 0.5
        self.facebookSignInView.layer.borderWidth = 0.5
        self.emailSignInView.layer.borderWidth = 0.5

        self.kakaoSignInView.layer.borderColor = UIColor.black.cgColor
        self.facebookSignInView.layer.borderColor = UIColor.black.cgColor
        self.emailSignInView.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        
        
    }
    
    @IBAction func kakaoButtonTapped(_ sender: UIButton) {
        
        if AuthApi.isKakaoTalkLoginAvailable() {            
            
            UserApi.shared.me() {(user, error) in
                if let error = error {
                    print(error)
                    
                    AuthApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                        
                        if let error = error {
                            print("error heree : %@",error)
                        } else {
                            //do something
                            _ = oauthToken
                            UserApi.shared.me() {(user, error) in
                                if let error = error {
                                    print(error)
                                } else {
                                    print("me() success.")

                                    //do something
                                    _ = user
                                    
                                    let userID = String(user!.id)
                                    let username = user?.properties?["nickname"]
                                    let email = user?.kakaoAccount?.email
                                    
                                    self.view.makeToastActivity(CSToastPositionCenter)
                                    UserManager.sharedInstance().signUp(withThirdPartyID: userID, withType: "kakao", username: username!, withEmail: email!) { (success) in
                                        self.view.hideAllToasts()
                                        if (success){
                                            self.dismiss(animated: true, completion: nil)
                                        } else {
                                            self.view.makeToast(NSLocalizedString("Error occured. Visit customer center if this error is repeated.", comment: ""), duration: 5, position: CSToastPositionCenter)

                                        }
                                    }
                                }
                            }
                        }
                    }

                } else {
                    print("me() success.")

                    //do something
                    _ = user
                    
                    let userID = String(user!.id)
                    let username = user?.properties?["nickname"]
                    let email = user?.kakaoAccount?.email
                    
                    self.view.makeToastActivity(CSToastPositionCenter)
                    UserManager.sharedInstance().signUp(withThirdPartyID: userID, withType: "kakao", username: username!, withEmail: email!) { (success) in
                        self.view.hideAllToasts()
                        if (success){
                            self.dismiss(animated: true, completion: nil)
                        } else {
                            self.view.makeToast(NSLocalizedString("Error occured. Visit customer center if this error is repeated.", comment: ""), duration: 5, position: CSToastPositionCenter)
                        }
                    }
                }
            }

        }
    }
    
    @IBAction func facebookButtonTapped(_ sender: UIButton) {
        
        
        // Swift override func viewDidLoad() { super.viewDidLoad() if let token = AccessToken.current, !token.isExpired { // User is logged in, do work such as go to next view controller. } }
        self.view.makeToastActivity(CSToastPositionCenter)

        if ((AccessToken.current?.hasGranted(permission: "email")) == true) {
            
            FBSDKCoreKit.Profile.loadCurrentProfile { (profile, error) in
                if profile != nil {
                    
                    let username = profile?.name ?? ""
                    let email = profile?.email ?? ""
                    let userID = profile?.userID ?? ""
                    
                    UserManager.sharedInstance().signUp(withThirdPartyID: userID, withType: "facebook", username: username, withEmail: email) { (success) in
                        self.view.hideAllToasts()

                        if success {
                            self.dismiss(animated: true, completion: nil)
                        } else {
                            self.view.makeToast(NSLocalizedString("Error occured. Visit customer center if this error is repeated.", comment: ""), duration: 5, position: CSToastPositionCenter)
                        }
                    }
                    
                }
            }
            
        } else {
            
            let loginManager = LoginManager.init()
            loginManager.logIn(permissions: ["public_profile", "email"], from: self) { (result, error) in
                if result != nil {
                    FBSDKCoreKit.Profile.loadCurrentProfile { (profile, error) in
                        if profile != nil {
                            
                            let username = profile?.name ?? ""
                            let email = profile?.email ?? ""
                            let userID = profile?.userID ?? ""
                            
                            UserManager.sharedInstance().signUp(withThirdPartyID: userID, withType: "facebook", username: username, withEmail: email) { (success) in
                                self.view.hideAllToasts()

                                if success {
                                    self.dismiss(animated: true, completion: nil)
                                } else {
                                    self.view.makeToast(NSLocalizedString("Error occured. Visit customer center if this error is repeated.", comment: ""), duration: 5, position: CSToastPositionCenter)
                                }
                            }
                        }
                    }
                }
            }
            
        }

        
    }
        
    @IBAction func emailButtonTapped(_ sender: UIButton) {
    }

    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    
    
}
