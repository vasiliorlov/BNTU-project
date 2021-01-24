//
//  LoginViewController.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//

import UIKit
import MBProgressHUD

class LoginViewController: UIViewController, LoginViewInput, TransitionAdapter {
    //ui
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPswd: UITextField!
    @IBOutlet weak var btnSignIn: UIButton!
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
        txtEmail.layer.cornerRadius = 8.0
        txtPswd.layer.cornerRadius = 8.0
        txtEmail.layer.borderColor = #colorLiteral(red: 0, green: 0.827958703, blue: 0.7647097707, alpha: 1)
        txtPswd.layer.borderColor = #colorLiteral(red: 0, green: 0.827958703, blue: 0.7647097707, alpha: 1)
        btnSignIn.layer.cornerRadius = 8.0
    }
    
    func showLoading(_ isActive: Bool) {
        DispatchQueue.main.async {
            if isActive {
                let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
            } else {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }
    }
    
    func showMessage(title: String, message: String) {
        DispatchQueue.main.async {
            if let _ = self.presentedViewController {
                return
            }
            
            let alert = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: .alert)
            let actionOk = UIAlertAction(title: NSLocalizedString("OK", comment: ""),
                                         style: .cancel) { (action: UIAlertAction) in }
            alert.addAction(actionOk)
            self.present(alert, animated: true) { }
        }
    }
    // MARK: - user Action
    
    @IBAction func tapOnScreen(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func btnSignInToiucnedIn(_ sender: Any) {
        let user = UserModel(email: txtEmail.text ?? "", password: txtPswd.text ?? "")
        presenter?.requireSignIn(user: user)
    }
}
