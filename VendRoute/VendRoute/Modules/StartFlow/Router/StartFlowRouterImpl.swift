//
//  StartFlowRouterImpl.swift
//  VendRoute
//
//  Created by Vasili Orlov on 24/10/2020.
//  Copyright © 2020 VR. All rights reserved.
//
import Foundation

class StartFlowRouterImpl: StartFlowRouter {
    
    weak var transitionAdapter: TransitionAdapter?
    
    func openPreviousScreen() {
        DispatchQueue.main.async {
            self.transitionAdapter?.navigationController?.popViewController(animated: true)
        }
    }
    
    func openLoginScreen() {
        let calendarVC = LoginModuleInitializer.createModule { _ in }
        DispatchQueue.main.async {
            self.transitionAdapter?.navigationController?.pushViewController(calendarVC, animated: true)
        }
    }
    
    func openPosListScreen() {
        let posListVC = PointOfSaleListModuleInitializer.createModule { _ in }
        DispatchQueue.main.async {
            self.transitionAdapter?.navigationController?.pushViewController(posListVC, animated: true)
        }
    }
}
