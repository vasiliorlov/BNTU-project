//
//  StartFlowInitializer.swift
//  VendRoute
//
//  Created by Vasili Orlov on 24/10/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class StartFlowModuleInitializer: NSObject {

    static let storyboardName: String = "StartFlow"

    class func createModule(configurationBlock: ((StartFlowModuleInput) -> Void)) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! StartFlowViewController
         
        let configurator = StartFlowModuleConfigurator()
        weak var wViewController = viewController
        configurator.configureModuleForViewInput(viewInput: wViewController)

	let moduleInput: StartFlowModuleInput = viewController.presenter as! StartFlowModuleInput
        configurationBlock(moduleInput)
       
        return viewController as UIViewController
    }
    


}
