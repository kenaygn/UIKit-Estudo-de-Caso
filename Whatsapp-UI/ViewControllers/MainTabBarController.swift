//
//  MainTabBarController.swift
//  Whatsapp-UI
//
//  Created by Kenay on 14/05/26.
//

import UIKit
import SwiftUI

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .label
        
        setupTabs()
    }
    
    private func setupTabs() {
        let callsVC = CallsController()
        let callsNav = UINavigationController(rootViewController: callsVC)
        callsNav.tabBarItem = UITabBarItem(title: "Ligações", image: UIImage(systemName: "phone"), tag: 0)
        
        let chatsView = ChatsView()
        let chatsVC = UIHostingController(rootView: chatsView)
        let chatsNav = UINavigationController(rootViewController: chatsVC)
        chatsNav.tabBarItem = UITabBarItem(title: "Conversas", image: UIImage(systemName: "bubble.right"), tag: 1)
        
        viewControllers = [callsNav, chatsNav]
    }
    
    
}

