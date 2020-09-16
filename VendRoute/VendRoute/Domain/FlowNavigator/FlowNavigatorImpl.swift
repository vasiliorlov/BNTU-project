//
//  FlowNavigatorImpl.swift
//  VendRoute
//
//  Created by Vasili Orlov on 16/09/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

class FlowNavigatorImpl: FlowNavigator {
    //dapendency
    var navigationVC: UIViewController
    var appSettings: AppSettings
    
    //MARk: - life cycle
    init(navigationVC: UIViewController, appSettings: AppSettings) {
        self.navigationVC = navigationVC
        self.appSettings = appSettings
    }
    
    //MARK: - FlowNavigator
    func openStartScreen() {
 
    }
}
