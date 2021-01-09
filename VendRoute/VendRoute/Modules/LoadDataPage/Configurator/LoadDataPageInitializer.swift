//
//  LoadDataPageInitializer.swift
//  VendRoute
//
//  Created by Vasili Orlov on 12/12/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class LoadDataPageModuleInitializer: NSObject {

    static let storyboardName: String = "LoadDataPage"

    class func createModule(configurationBlock: ((LoadDataPageModuleInput) -> Void)) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! LoadDataPageViewController
         
        let configurator = LoadDataPageModuleConfigurator()
        weak var wViewController = viewController
        configurator.configureModuleForViewInput(viewInput: wViewController)

	let moduleInput: LoadDataPageModuleInput = viewController.presenter as! LoadDataPageModuleInput
        configurationBlock(moduleInput)
       
        return viewController as UIViewController
    }
    


}
