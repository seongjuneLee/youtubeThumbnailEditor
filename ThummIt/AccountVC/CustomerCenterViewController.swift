//
//  CustomerCenterVC.swift
//  ThummIt
//
//  Created by 이성준 on 2021/03/15.
//

import Foundation
import KakaoSDKTalk
import KakaoSDKUser
import SafariServices

class CustomerCenterViewController: UIViewController {
    var safariViewController : SFSafariViewController? // to keep instance
    
    
    @IBAction func inquireButtonTapped(_ sender: Any) {
        
        self.safariViewController = SFSafariViewController(url: TalkApi.shared.makeUrlForChannelChat(channelPublicId:"_BmhYK")!)

        guard (self.safariViewController != nil) else { return }

        self.safariViewController?.modalTransitionStyle = .crossDissolve
        self.safariViewController?.modalPresentationStyle = .overCurrentContext
        self.present(self.safariViewController!, animated: true) {}
        
    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
