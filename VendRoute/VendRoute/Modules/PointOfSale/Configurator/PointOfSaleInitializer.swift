//
//  PointOfSaleInitializer.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class PointOfSaleModuleInitializer: NSObject {

    static let storyboardName: String = "PointOfSale"

    class func createModule(configurationBlock: ((PointOfSaleModuleInput) -> Void)) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! PointOfSaleViewController
         
        let configurator = PointOfSaleModuleConfigurator()
        weak var wViewController = viewController
        configurator.configureModuleForViewInput(viewInput: wViewController)

	let moduleInput: PointOfSaleModuleInput = viewController.presenter as! PointOfSaleModuleInput
        configurationBlock(moduleInput);
       
        return viewController as UIViewController;
    }
    


}
