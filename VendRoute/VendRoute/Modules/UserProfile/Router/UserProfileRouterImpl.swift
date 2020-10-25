//
//  UserProfileRouterImpl.swift
//  VendRoute
//
//  Created by Vasili Orlov on 25/10/2020.
//  Copyright © 2020 VR. All rights reserved.
//

class UserProfileRouterImpl: UserProfileRouter {

    weak var transitionAdapter: TransitionAdapter?

    func openPreviousScreen() {
        self.transitionAdapter?.navigationController?.popViewController(animated: true)
    }
}
