//
//  StartFlowConfigurator.swift
//  VendRoute
//
//  Created by Vasili Orlov on 24/10/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class StartFlowModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? StartFlowViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: StartFlowViewController) {

        let router = StartFlowRouterImpl()
        router.transitionAdapter = viewController
        
        let daoAsm = Container.shared.dataAsm

        let presenter = StartFlowPresenter(router: router,
                                           view: viewController,
                                           appSettings: daoAsm.appSettings)
        presenter.view = viewController
        presenter.router = router

        viewController.presenter = presenter
    }

}
