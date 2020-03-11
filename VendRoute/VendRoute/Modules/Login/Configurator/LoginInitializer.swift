//
//  LoginInitializer.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class LoginModuleInitializer: NSObject {

    static let storyboardName: String = "Login"

    class func createModule(configurationBlock: ((LoginModuleInput) -> Void)) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! LoginViewController
         
        let configurator = LoginModuleConfigurator()
        weak var wViewController = viewController
        configurator.configureModuleForViewInput(viewInput: wViewController)

	let moduleInput: LoginModuleInput = viewController.presenter as! LoginModuleInput
        configurationBlock(moduleInput);
       
        return viewController as UIViewController;
    }
    


}
