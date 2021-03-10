//
//  AppDelegate.swift
//  ThummIt
//
//  Created by 이성준 on 2021/01/20.
//

import Foundation
import UIKit
import Parse
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import FBSDKCoreKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate{
    
    
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        
        MigratorJul.shared().migrateIfNeeded()
        
        Parse.initialize(with: ParseClientConfiguration(block: { ( configuration :  ParseMutableClientConfiguration) in
            configuration.applicationId = "myappID";
            configuration.clientKey = "3IKuPKnRgLwN"
            configuration.server = "http://3.35.208.70/parse";
        }))
        
        if PFUser.current() != nil {
            let defaultACL = PFACL.init()
            defaultACL.setReadAccess(true, for: PFUser.current()!)
            PFACL.setDefault(defaultACL, withAccessForCurrentUser: true)
        } else {
            
            let newUser = PFUser.init()
            let username = NSString.randomString(withLength: 7) as String
            let password = NSString.randomString(withLength: 10) as String
            UserManager.sharedInstance().validatedUserName(username) { (validatedString) in
                newUser["username"] = validatedString
                newUser["password"] = password
                newUser.signUpInBackground()
            }
        }

        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )

        KakaoSDKCommon.initSDK(appKey: "4df206455336b6c8a2d990fd54b0bb39")
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID

        // Override point for customization after application launch.
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        let currentInstallation = PFInstallation.current()
        currentInstallation?.setDeviceTokenFrom(deviceToken)
        currentInstallation?.saveInBackground()
        
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration.init(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
        //        // Called when the user discards a scene session.
        //        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        //        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        
    }
    //facebook_login
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
//        if (url.scheme == kakaoURLScheme) {
        if (AuthApi.isKakaoTalkLoginUrl(url)) {
            return AuthController.handleOpenUrl(url: url)
        }
//        }
        if (url.scheme == googleURLScheme) {
            if GIDSignIn.sharedInstance().handle(url) {
                return GIDSignIn.sharedInstance().handle(url)
            }
        }

        return false;

    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        KOSession.handleDidBecomeActive()
    }
    
}

