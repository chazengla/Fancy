//
//  AppTabViewController.swift
//  Fancy
//
//  Created by Arnie Englander on 10/11/2019.
//  Copyright © 2019 Arnie Englander. All rights reserved.
//

import UIKit

class AppTabViewController: UITabBarController {
    
    override func viewDidLoad() {
    
        setupTabBar()
    }
    
    
    func setupTabBar(){
        
        tabBar.tintColor = Document.hotPink
        tabBar.barTintColor = Document.white
//        self.tabBar.itemPositioning = .centered
        
        let homevc = HomeViewController()
        homevc.tabBarItem.image = UIImage(named: "home")
        homevc.title = nil
        
        let cartvc = EmptyCartViewController()
        cartvc.tabBarItem.image = UIImage(named: "cart")
        
        let profilevc = ProfilePageViewController()
        profilevc.tabBarItem.image = UIImage(named: "profile")
        
        viewControllers = [homevc, cartvc, profilevc]
    }

}
