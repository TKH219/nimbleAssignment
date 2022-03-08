//
//  AppDelegate.swift
//  nimbleAssignment
//
//  Created by Trần Khánh Hà on 02/03/2022.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window:UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            let login = HomePageViewController()
            let nav = UINavigationController(rootViewController: login)
            window.rootViewController = nav
            nav.navigationBar.isHidden = true
            window.makeKeyAndVisible()
        }
        
        IQKeyboardManager.shared.enable = true
        
        return true
    }
}

