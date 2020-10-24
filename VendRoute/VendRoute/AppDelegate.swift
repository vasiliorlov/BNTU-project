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
        let viewController = UIStoryboard(name: "PointOfSaleList", bundle: nil).instantiateInitialViewController()!
        let navigationViewController = UINavigationController(rootViewController: viewController)
        navigationViewController.navigationBar.isHidden = true
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationViewController
        self.window?.makeKeyAndVisible()
        
        container = Container.shared
        
        amplifyConfigure()
        
       /*
        let productDao = container?.dataAsm.productDao
        let posDao = container?.dataAsm.posDao
       
        let adress1 = Adress(city: "minsk", street: "Victory", gps: GpsCoordinate(longitude: 11.11, latitude: 22.22), postCode: 213078)
         let adress2 = Adress(city: "mogilev", street: "lenin", gps: GpsCoordinate(longitude: 33.33, latitude: 44.44), postCode: 240789)
        
        let pos1 = PointOfSale(id: UUID(), name: "pos1", adress: adress1, comment: "com", isCollect: true, isInventory: false, isService: true, needCollect: true, needInventory: true, needService: false)
         let pos2 = PointOfSale(id: UUID(), name: "pos2", adress: adress2, comment: nil, isCollect: false, isInventory: true, isService: false, needCollect: false, needInventory: false, needService: true)
        
        posDao?.save([pos1, pos2])
        
        let result = posDao?.getAll()
      */
        /*
        let measure1 = Measure(id: UUID(), measureFactor: 1, name: "Each")
        let measure2 = Measure(id: UUID(), measureFactor: 6, name: "Box")
        
        let produc1 = Product(id: UUID(), name: "Cola", measure: measure1)
        let produc2 = Product(id: UUID(), name: "ColaBox", measure: measure2)
        
        productDao?.save([produc1, produc2])
        
        let products = productDao?.getAll()
 */
        
        let logInVC = StartFlowModuleInitializer.createModule { _ in
        }
        navigationViewController.pushViewController(logInVC, animated: false)
        return true
    }
    
    private func amplifyConfigure() {
        do {
                try Amplify.add(plugin: AWSCognitoAuthPlugin())
                try Amplify.add(plugin: AWSAPIPlugin())
                try Amplify.configure()
                print("Amplify configured with API and Auth plugin")
            } catch {
                print("Failed to initialize Amplify with \(error)")
            }
    }
}

