//
//  PointOfSaleListConfigurator.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class PointOfSaleListModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? PointOfSaleListViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PointOfSaleListViewController) {

        let router = PointOfSaleListRouterImpl()
        router.transitionAdapter = viewController
        
        let daoAsm = Container.shared.dataAsm

        let presenter = PointOfSaleListPresenter(router: router,
                                                 view: viewController,
                                                 posDao: daoAsm.posDao)
        presenter.view = viewController
        presenter.router = router

        viewController.presenter = presenter
    }

}
