//
//  AppDelegate.swift
//  ThummIt
//
//  Created by 이성준 on 2021/01/20.
//

import Foundation
import UIKit


@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate{
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        MigratorJul.shared().migrateIfNeeded()
        self.requestPermission()

        // Override point for customization after application launch.
        return true
    }
    func requestPermission() {
//        if #available(iOS 14, *) {
//            ATTrackingManager.requestTrackingAuthorization { status in
//                switch status {
//                case .authorized:
//                    // Tracking authorization dialog was shown
//                    // and we are authorized
//                    print("Authorized")
//
//                    // Now that we are authorized we can get the IDFA
//                case .denied:
//                    // Tracking authorization dialog was
//                    // shown and permission is denied
//                    print("Denied")
//                case .notDetermined:
//                    // Tracking authorization dialog has not been shown
//                    print("Not Determined")
//                case .restricted:
//                    print("Restricted")
//                @unknown default:
//                    print("Unknown")
//                }
//            }
//        }
    }


    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
                
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
        
    func applicationDidBecomeActive(_ application: UIApplication) {
        
        
    }
     
}

