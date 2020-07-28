//
//  LoginViewController.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewInput, TransitionAdapter {
    //ui
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPswd: UITextField!
    @IBOutlet weak var lblVersion: UILabel!
    //dependency
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
