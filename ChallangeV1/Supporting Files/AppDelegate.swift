//
//  AppDelegate.swift
//  ChallangeV1
//
//  Created by Abdelrahman Nasser on 4/12/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.rootViewController = HomeRouter.createHomeModule()
        window?.makeKeyAndVisible()
        return true
    }
}

