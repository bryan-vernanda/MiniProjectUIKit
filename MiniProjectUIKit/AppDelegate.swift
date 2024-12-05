//
//  AppDelegate.swift
//  MiniProjectUIKit
//
//  Created by Bryan Vernanda on 05/12/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let router = FoodListRouter.startExecution()
        let initialViewController = router.entry!
        
        let navigation = UINavigationController()
        navigation.viewControllers = [initialViewController]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = navigation
        
        return true
    }

}

