//
//  CalendarChoiseConfigurator.swift
//  VendRoute
//
//  Created by Vasili Orlov on 14/09/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class CalendarChoiseModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? CalendarChoiseViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CalendarChoiseViewController) {

        let router = CalendarChoiseRouterImpl()
        router.transitionAdapter = viewController

        let presenter = CalendarChoisePresenter(router: router, view: viewController)
        presenter.view = viewController
        presenter.router = router

        viewController.presenter = presenter
    }

}
