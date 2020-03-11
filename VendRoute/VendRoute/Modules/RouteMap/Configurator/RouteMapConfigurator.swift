//
//  RouteMapConfigurator.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class RouteMapModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? RouteMapViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: RouteMapViewController) {

        let router = RouteMapRouterImpl()
        router.transitionAdapter = viewController

        let presenter = RouteMapPresenter(router: router, view: viewController)
        presenter.view = viewController
        presenter.router = router

        viewController.presenter = presenter
    }

}
