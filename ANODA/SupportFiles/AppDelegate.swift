//
//  AppDelegate.swift
//  ANODA
//
//  Created by mac on 13.06.2020.
//  Copyright © 2020 Aleksandr Balabon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let mainTabBarController = MainTabBarViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = mainTabBarController
        
        return true
    }

}

