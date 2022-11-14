//
//  MainTabbarViewController.swift
//  ThummIt
//
//  Created by 이성준 on 2022/11/12.
//

import Foundation
import UIKit

class MainTabbarViewController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        continueImage, homeTabbarImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let homeTabbarItem = UITabBarItem(title: "home", image: UIImage(named: "homeTabBarImage"), tag: 0)
        
        
        
        let projectTabbarItem = UITabBarItem(title: "continue", image: UIImage(named: "continueTabBarImage"), tag: 1)
        
        
        
    }
    
}
