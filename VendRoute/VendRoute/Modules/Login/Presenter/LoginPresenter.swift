//
//  LoginPresenter.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

class LoginPresenter: LoginModuleInput, LoginViewOutput {

    // dependencies
    weak var view: LoginViewInput?
    var router: LoginRouter

    init(router: LoginRouter, view: LoginViewInput) {
        self.view = view
        self.router = router
    }

    func viewIsReady() {
	view?.setupInitialState()
    }
}
