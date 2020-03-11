//
//  PointOfSaleListRouterImpl.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

class PointOfSaleListRouterImpl: PointOfSaleListRouter {

    weak var transitionAdapter: TransitionAdapter?

    func openPreviousScreen() {
        self.transitionAdapter?.navigationController?.popViewController(animated: true)
    }
}
