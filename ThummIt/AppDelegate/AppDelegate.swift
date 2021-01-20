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
 
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        MigratorJul.shared().migrateIfNeeded()
        
        Parse.initialize(with: ParseClientConfiguration(block: { ( configuration :  ParseMutableClientConfiguration) in
            configuration.applicationId = "myappID";
            configuration.clientKey = "BcwGJj2vgmdM"
            configuration.server = "http://3.34.137.65/parse";
        }))

    }
    
    
    
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration.init(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

        //        // Called when the user discards a scene session.
        //        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        //        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.

    }
    
    //kakao
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        KakaoSDKCommon.initSDK(appKey: "NATIVE_APP_KEY")
        return true;
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if (AuthApi.isKakaoTalkLoginUrl(url)) {
            return AuthController.handleOpenUrl(url: url)
        }
        
        return false
    }
    

    
}
