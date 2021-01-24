//
//  AppDelegate.swift
//  VendRoute
//
//  Created by Vasili Orlov on 3/10/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit
import Amplify
import AmplifyPlugins

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var container: Container?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let viewController = UIStoryboard(name: "StartFlow", bundle: nil).instantiateInitialViewController()!
        let navigationViewController = UINavigationController(rootViewController: viewController)
        navigationViewController.navigationBar.isHidden = true
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationViewController
        self.window?.makeKeyAndVisible()
        
        container = Container.shared
        
        amplifyConfigure()
        
        
        let logInVC = StartFlowModuleInitializer.createModule { _ in
        }
        navigationViewController.pushViewController(logInVC, animated: false)
        
        Amplify.API.query(request: .list(DynVisit.self)){ event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let todo):
                    print("Successfully retrieved list of todos: \(todo)")

                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
        return true
    }
    
    private func amplifyConfigure() {
        do {
                try Amplify.add(plugin: AWSCognitoAuthPlugin())
                try Amplify.add(plugin: AWSAPIPlugin())
                try Amplify.add(plugin: AWSAPIPlugin(modelRegistration: AmplifyModels()))
                try Amplify.configure()
                print("Amplify configured with API and Auth plugin")
            } catch {
                print("Failed to initialize Amplify with \(error)")
            }
    }
}

