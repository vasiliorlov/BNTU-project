//
//  AppDelegate.swift
//  VendRoute
//
//  Created by Vasili Orlov on 3/10/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let viewController = UIStoryboard(name: "PointOfSaleList", bundle: nil).instantiateInitialViewController()!
          let navigationViewController = UINavigationController(rootViewController: viewController)
          navigationViewController.navigationBar.isHidden = true
          self.window = UIWindow(frame: UIScreen.main.bounds)
          self.window?.rootViewController = navigationViewController
          self.window?.makeKeyAndVisible()
        return true
    }

}

