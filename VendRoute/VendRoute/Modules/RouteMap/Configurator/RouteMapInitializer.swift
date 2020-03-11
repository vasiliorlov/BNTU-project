//
//  RouteMapInitializer.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class RouteMapModuleInitializer: NSObject {

    static let storyboardName: String = "RouteMap"

    class func createModule(configurationBlock: ((RouteMapModuleInput) -> Void)) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! RouteMapViewController
         
        let configurator = RouteMapModuleConfigurator()
        weak var wViewController = viewController
        configurator.configureModuleForViewInput(viewInput: wViewController)

	let moduleInput: RouteMapModuleInput = viewController.presenter as! RouteMapModuleInput
        configurationBlock(moduleInput);
       
        return viewController as UIViewController;
    }
    


}
