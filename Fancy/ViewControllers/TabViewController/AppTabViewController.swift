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
        
        let homevc = HomeViewController()
        homevc.title = "Home"
        
        let cartvc = CartViewController()
        cartvc.title = "Cart"
        
        let profilevc = ProfilePageViewController()
        profilevc.title = "Profile"
        
        viewControllers = [homevc, cartvc, profilevc]
    }

}
