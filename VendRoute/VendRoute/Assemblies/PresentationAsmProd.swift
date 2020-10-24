//
//  PresentationAsmProd.swift
//  VendRoute
//
//  Created by Vasili Orlov on 3/10/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit
import SideNavigationController

class PresentationAsmProd: PresentationAsm {
    lazy var navigationController: SideNavigationController = createNavigationController()
    
    init() {
        self.navigationController = SideNavigationController()
    }
    
    private func createNavigationController() -> SideNavigationController {
        let sideNavigationController = SideNavigationController(mainViewController: UINavigationController(rootViewController: ViewController()))
        sideNavigationController.rightSide(viewController: UIViewController())
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = sideNavigationController
        }
        
        return sideNavigationController
    }
    
}
