//
//  PointOfSaleListPresenter.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

class PointOfSaleListPresenter: PointOfSaleListModuleInput, PointOfSaleListViewOutput {

    // dependencies
    weak var view: PointOfSaleListViewInput?
    var router: PointOfSaleListRouter

    init(router: PointOfSaleListRouter, view: PointOfSaleListViewInput) {
        self.view = view
        self.router = router
    }

    func viewIsReady() {
	view?.setupInitialState()
    }
}
