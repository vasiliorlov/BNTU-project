//
//  LoginConfigurator.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class LoginModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? LoginViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: LoginViewController) {

        let router = LoginRouterImpl()
        router.transitionAdapter = viewController

        let presenter = LoginPresenter(router: router, view: viewController)
        presenter.view = viewController
        presenter.router = router

        viewController.presenter = presenter
    }

}
