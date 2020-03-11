//
//  PointOfSaleListInitializer.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class PointOfSaleListModuleInitializer: NSObject {

    static let storyboardName: String = "PointOfSaleList"

    class func createModule(configurationBlock: ((PointOfSaleListModuleInput) -> Void)) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! PointOfSaleListViewController
         
        let configurator = PointOfSaleListModuleConfigurator()
        weak var wViewController = viewController
        configurator.configureModuleForViewInput(viewInput: wViewController)

	let moduleInput: PointOfSaleListModuleInput = viewController.presenter as! PointOfSaleListModuleInput
        configurationBlock(moduleInput);
       
        return viewController as UIViewController;
    }
    


}
