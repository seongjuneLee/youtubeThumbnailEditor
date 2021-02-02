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
                            
                            let userID = NSString.localizedStringWithFormat("%d", user?.id as! CVarArg)
                            let username = user?.properties?["nickname"]
                            let email = user?.kakaoAccount?.email
                            UserManager.sharedInstance().signUp(withKakaoTalkUserID: userID as String, withType: "kakao", username: username!, withEmail: email!) { (success) in
                                if (success) {
                                    self.dismissSelf()
                                }
                            }
                        }
                    }

                }
            }

        }
        
    }
    
    @objc public func dismissSelf(){
        self.removeFromParent()
        self.view.removeFromSuperview()
    }
    
    
    @IBAction func facebookButtonTapped(_ sender: UIButton) {
    }
    
//    @IBAction func googleButtonTapped(_ sender: GIDSignInButton) {
//    }
//
//
//    @IBAction func appleButtonTapped(_ sender: UIButton) {
//    }
    
    @IBAction func emailButtonTapped(_ sender: UIButton) {
    }
    
}
