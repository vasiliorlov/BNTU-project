//
//  CalendarChoiseRouterImpl.swift
//  VendRoute
//
//  Created by Vasili Orlov on 14/09/2020.
//  Copyright © 2020 VR. All rights reserved.
//
import Foundation

class CalendarChoiseRouterImpl: CalendarChoiseRouter {

    weak var transitionAdapter: TransitionAdapter?

    func openPreviousScreen() {
        self.transitionAdapter?.navigationController?.popViewController(animated: true)
    }
    
    func openLoadScreen() {
        let loadDataVC = LoadDataPageModuleInitializer.createModule { _ in }
        DispatchQueue.main.async {
            self.transitionAdapter?.navigationController?.pushViewController(loadDataVC, animated: true)
        }
    }
}
