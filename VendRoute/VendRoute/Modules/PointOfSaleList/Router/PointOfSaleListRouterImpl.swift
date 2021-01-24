//
//  PointOfSaleListRouterImpl.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//
import Foundation
import UIKit
import iOS_Slide_Menu

class PointOfSaleListRouterImpl: PointOfSaleListRouter {
    
    weak var transitionAdapter: TransitionAdapter?
    
    func openPreviousScreen() {
        DispatchQueue.main.async {
            self.transitionAdapter?.navigationController?.popViewController(animated: true)
        }
    }
    
    func openVisitScreen(for posId: PosId){
        let overviewVC = PointOfSaleModuleInitializer.createModule { input in
            input.posId = posId
        }
        DispatchQueue.main.async {
            self.transitionAdapter?.navigationController?.pushViewController(overviewVC, animated: true)
        }
    }
    
    func openChooseServiceDayScreen() {
        DispatchQueue.main.async {
            let chooseServiceDayVC = CalendarChoiseModuleInitializer.createModule { _ in }
            if let navVC = self.transitionAdapter?.navigationController {
                let viewcontrollers = navVC.viewControllers
                for viewcontroller in viewcontrollers.reversed() {
                    if viewcontroller is StartFlowViewController {
                        break
                    } else {
                        navVC.popViewController(animated: false)
                    }
                }
                navVC.pushViewController(chooseServiceDayVC, animated: true)
            }
        }
    }
    
    func openLoginScreen() {
        DispatchQueue.main.async {
            let loginVC = LoginModuleInitializer.createModule { _ in }
            if let navVC = self.transitionAdapter?.navigationController {
                let viewcontrollers = navVC.viewControllers
                for viewcontroller in viewcontrollers.reversed() {
                    if viewcontroller is StartFlowViewController {
                        break
                    } else {
                        navVC.popViewController(animated: false)
                    }
                }
                navVC.pushViewController(loginVC, animated: true)
            }
        }
    }
    
    func openUserProfileScreen(output: UserProfileModuleOutput) {
        DispatchQueue.main.async {
            let menuController = Container.shared.presentationAsm.navigationController
            if let rightMenu = menuController.leftMenu as? UserProfileViewController {
                if let moduleInput = rightMenu.presenter as? UserProfileModuleInput {
                    moduleInput.output = output
                }
            } else {
                let menu = UserProfileModuleInitializer.createModule(configurationBlock: { moduleInput in
                    moduleInput.output = output
                })
                menuController.leftMenu = menu
            }
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                appDelegate.window?.rootViewController = menuController
            }
            menuController.open(MenuLeft, withCompletion: {})
        }
    }
    
    func openMapScreen() {
        DispatchQueue.main.async {
            let mapVC = RouteMapModuleInitializer.createModule { _ in }
            self.transitionAdapter?.navigationController?.pushViewController(mapVC, animated: true)
        }
    }
}
