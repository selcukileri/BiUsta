//
//  MainTabBarController.swift
//  BiUsta
//
//  Created by Selçuk İleri on 22.03.2024.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "BiUsta"
        configureTabBar()
    }
    
    func configureTabBar(){
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "home_icon"), selectedImage: UIImage(systemName: "home_icon_selected"))
        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile_icon"), selectedImage: UIImage(named: "profile_icon_selected"))
        let settingsViewController = UINavigationController(rootViewController: SettingsViewController())
        settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings_icon"), selectedImage: UIImage(named: "settings_icon_selected"))
        
        
        viewControllers = [homeViewController, profileViewController, settingsViewController]
    }

}
