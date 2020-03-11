//
//  PointOfSalePresenter.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

class PointOfSalePresenter: PointOfSaleModuleInput, PointOfSaleViewOutput {

    // dependencies
    weak var view: PointOfSaleViewInput?
    var router: PointOfSaleRouter

    init(router: PointOfSaleRouter, view: PointOfSaleViewInput) {
        self.view = view
        self.router = router
    }

    func viewIsReady() {
	view?.setupInitialState()
    }
}
