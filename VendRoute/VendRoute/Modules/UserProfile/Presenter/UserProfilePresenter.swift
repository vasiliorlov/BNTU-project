//
//  UserProfilePresenter.swift
//  VendRoute
//
//  Created by Vasili Orlov on 25/10/2020.
//  Copyright © 2020 VR. All rights reserved.
//

class UserProfilePresenter: UserProfileModuleInput, UserProfileViewOutput {

    // dependencies
    weak var view: UserProfileViewInput?
    var router: UserProfileRouter
    weak var output: UserProfileModuleOutput? 

    init(router: UserProfileRouter, view: UserProfileViewInput) {
        self.view = view
        self.router = router
    }

    func viewIsReady() {
	view?.setupInitialState()
    }
}
