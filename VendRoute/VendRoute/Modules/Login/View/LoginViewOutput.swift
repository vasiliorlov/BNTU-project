//
//  LoginViewOutput.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

protocol LoginViewOutput {

    /**
        @author Vasili Orlov
        Notify presenter that view is ready
    */

    func viewIsReady()
    func requireSignIn(user: UserModel)
}
