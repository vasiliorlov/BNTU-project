//
//  PresentationAsmProd.swift
//  VendRoute
//
//  Created by Vasili Orlov on 3/10/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit
import iOS_Slide_Menu

class PresentationAsmProd: PresentationAsm {
    lazy var navigationControllerInstance: SlideNavigationController = createNavigationController()

    
    private func createNavigationController() -> SlideNavigationController {
        let storyboard = UIStoryboard(name: "SlideNavigationController", bundle: nil)
        let slideController = storyboard.instantiateInitialViewController() as! SlideNavigationController
        let screenSize = UIScreen.main.bounds
        let width = screenSize.width < screenSize.height ? screenSize.width : screenSize.height
        let height = screenSize.width < screenSize.height ? screenSize.height : screenSize.width
        
        slideController.avoidSwitchingToSameClassViewController = true
        slideController.panGestureSideOffset = 50
        slideController.enableSwipeGesture = true
        slideController.portraitSlideOffset = width - 280
        slideController.landscapeSlideOffset = height - 280
        
        return slideController
    }
 
    public var screenWidth: CGFloat {
        return min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
    }
    
    public var screenHeight: CGFloat {
        return max(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
    }
    
    var navigationController: SlideNavigationController {
        return navigationControllerInstance
    }
}
