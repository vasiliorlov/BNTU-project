//
//  RouteMapPresenter.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

class RouteMapPresenter: RouteMapModuleInput, RouteMapViewOutput {

    // dependencies
    weak var view: RouteMapViewInput?
    var router: RouteMapRouter

    init(router: RouteMapRouter, view: RouteMapViewInput) {
        self.view = view
        self.router = router
    }

    func viewIsReady() {
	view?.setupInitialState()
    }
}
