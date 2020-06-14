//
//  MainTabBarViewController.swift
//  ANODA
//
//  Created by mac on 13.06.2020.
//  Copyright © 2020 Aleksandr Balabon. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        view.backgroundColor = .black
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        
        //home
        let homeNavController = templateNavController(rootViewController: HomeViewController(collectionViewLayout: UICollectionViewFlowLayout()), unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectedImage: #imageLiteral(resourceName: "home_selected"))
        
        //search
        let searchNavController = templateNavController(rootViewController: SearchViewController(), unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectedImage: #imageLiteral(resourceName: "search_selected"))
        
        //plus
        let plusNavController = templateNavController(rootViewController: PlusViewController(), unselectedImage: #imageLiteral(resourceName: "add_selected"), selectedImage: #imageLiteral(resourceName: "add_unselected"))
        
        //like
        let likeNavController = templateNavController(rootViewController: LikeViewController(), unselectedImage: #imageLiteral(resourceName: "heart_unselected"), selectedImage: #imageLiteral(resourceName: "heart_selected"))
        
        //profile
        let profileNavController = templateNavController(rootViewController: ProfileController(), unselectedImage: #imageLiteral(resourceName: "user_unselected"), selectedImage: #imageLiteral(resourceName: "user_selected"))
        
        // Tab bar view controllers
        tabBar.tintColor = .black
        tabBar.barTintColor = UIColor.white
        viewControllers = [homeNavController, searchNavController, plusNavController, likeNavController, profileNavController]
        
        // Modify tab bar item insets
        guard let items = tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
        
    }
    
    private func templateNavController(rootViewController: UIViewController,unselectedImage: UIImage, selectedImage: UIImage) -> UINavigationController {
        
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
}
