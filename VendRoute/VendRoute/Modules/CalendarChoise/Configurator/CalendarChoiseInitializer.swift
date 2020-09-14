//
//  CalendarChoiseInitializer.swift
//  VendRoute
//
//  Created by Vasili Orlov on 14/09/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class CalendarChoiseModuleInitializer: NSObject {

    static let storyboardName: String = "CalendarChoise"

    class func createModule(configurationBlock: ((CalendarChoiseModuleInput) -> Void)) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! CalendarChoiseViewController
         
        let configurator = CalendarChoiseModuleConfigurator()
        weak var wViewController = viewController
        configurator.configureModuleForViewInput(viewInput: wViewController)

	let moduleInput: CalendarChoiseModuleInput = viewController.presenter as! CalendarChoiseModuleInput
        configurationBlock(moduleInput)
       
        return viewController as UIViewController
    }
    


}
