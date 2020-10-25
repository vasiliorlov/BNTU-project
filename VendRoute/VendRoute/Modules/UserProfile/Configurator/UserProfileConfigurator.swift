//
//  UserProfileConfigurator.swift
//  VendRoute
//
//  Created by Vasili Orlov on 25/10/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class UserProfileModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? UserProfileViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: UserProfileViewController) {

        let router = UserProfileRouterImpl()
        router.transitionAdapter = viewController

        let presenter = UserProfilePresenter(router: router, view: viewController)
        presenter.view = viewController
        presenter.router = router

        viewController.presenter = presenter
    }

}
