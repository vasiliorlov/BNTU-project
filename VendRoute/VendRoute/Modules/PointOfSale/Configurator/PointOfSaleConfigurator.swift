//
//  PointOfSaleConfigurator.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class PointOfSaleModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? PointOfSaleViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PointOfSaleViewController) {

        let router = PointOfSaleRouterImpl()
        router.transitionAdapter = viewController
        
        let dataAsm = Container.shared.dataAsm

        let presenter = PointOfSalePresenter(router: router,
                                             view: viewController,
                                             posDao: dataAsm.posDao,
                                             visitDao: dataAsm.visitDao,
                                             imageDao: dataAsm.imageDao)
        presenter.view = viewController
        presenter.router = router

        viewController.presenter = presenter
    }

}
