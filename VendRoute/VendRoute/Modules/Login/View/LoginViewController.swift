//
//  LoginViewController.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewInput, TransitionAdapter {

    var presenter: LoginViewOutput?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewIsReady()
    }


    // MARK: LoginViewInput
    func setupInitialState() {
    }
}
