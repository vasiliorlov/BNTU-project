//
//  PointOfSaleRouterImpl.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//
import Foundation

class PointOfSaleRouterImpl: PointOfSaleRouter {

    weak var transitionAdapter: TransitionAdapter?

    func openPreviousScreen() {
        DispatchQueue.main.async {
        self.transitionAdapter?.navigationController?.popViewController(animated: true)
        }
    }
}
