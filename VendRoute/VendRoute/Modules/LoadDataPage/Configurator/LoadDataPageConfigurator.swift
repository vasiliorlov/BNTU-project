//
//  LoadDataPageConfigurator.swift
//  VendRoute
//
//  Created by Vasili Orlov on 12/12/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class LoadDataPageModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? LoadDataPageViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: LoadDataPageViewController) {

        let router = LoadDataPageRouterImpl()
        router.transitionAdapter = viewController
        
        let domainAsm = Container.shared.domainAsm
        let dataAsm = Container.shared.dataAsm

        let presenter = LoadDataPagePresenter(router: router,
                                              view: viewController,
                                              downloadManager: domainAsm.downloadS3Manager,
                                              appSettings: dataAsm.appSettings)
        presenter.view = viewController
        presenter.router = router

        viewController.presenter = presenter
    }

}
