//
//  UserProfileInitializer.swift
//  VendRoute
//
//  Created by Vasili Orlov on 25/10/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class UserProfileModuleInitializer: NSObject {

    static let storyboardName: String = "UserProfile"

    class func createModule(configurationBlock: ((UserProfileModuleInput) -> Void)) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! UserProfileViewController
         
        let configurator = UserProfileModuleConfigurator()
        weak var wViewController = viewController
        configurator.configureModuleForViewInput(viewInput: wViewController)

	let moduleInput: UserProfileModuleInput = viewController.presenter as! UserProfileModuleInput
        configurationBlock(moduleInput)
       
        return viewController as UIViewController
    }
    


}
