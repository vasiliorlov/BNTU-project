//
//  LoginRouterImpl.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//
import Foundation

class LoginRouterImpl: LoginRouter {
    
    weak var transitionAdapter: TransitionAdapter?
    
    func openPreviousScreen() {
        DispatchQueue.main.async {
            self.transitionAdapter?.navigationController?.popViewController(animated: true)
        }
    }
    
    func openCalendarScreen() {
        DispatchQueue.main.async {
            let calendarVC = CalendarChoiseModuleInitializer.createModule { _ in }
            self.transitionAdapter?.navigationController?.pushViewController(calendarVC, animated: true)
        }
    }
    
    func openPosListScreen() {
        DispatchQueue.main.async {
            let posListVC = PointOfSaleListModuleInitializer.createModule { _ in }
            self.transitionAdapter?.navigationController?.pushViewController(posListVC, animated: true)
        }
    }
}
