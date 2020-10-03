//
//  LoginPresenter.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/03/2020.
//  Copyright © 2020 VR. All rights reserved.
//
import Foundation
import Amplify
import AmplifyPlugins

class LoginPresenter: LoginModuleInput, LoginViewOutput {
    //const
    let signInText = NSLocalizedString("Sign In", comment: "")
    let fetchSessionText = NSLocalizedString("Fetch a session", comment: "")
    // dependencies
    weak var view: LoginViewInput?
    var router: LoginRouter
    private var authManager: AuthManager
    
    init(router: LoginRouter, view: LoginViewInput, authManager: AuthManager) {
        self.view = view
        self.router = router
        self.authManager = authManager
        self.authManager.output = self
    }
    
    //MARK: - LoginViewOutput
    func viewIsReady() {
        view?.setupInitialState()
        
        if authManager.userState == .signedIn {
            router.openCalendarScreen()
        }
    }
    
    func requireSignIn(user: UserModel) {
        let request = SignInRequest(username: user.email, password: user.password)
        authManager.signIn(request)
    }
}

//MARK: - AuthManagerOutput
extension LoginPresenter: AuthManagerOutput {
    func didSFetchSession(_ session: AuthSession) {}
    
    func didSuccessfully(_ operation: AuthOperation) {
        view?.showLoading(false)
        switch operation {
        case .signIn : router.openCalendarScreen()
        default: return
        }
    }
    
    func didErrorOccuredOnOperation(_ operation: AuthOperation, error: AmplifyError) {
        view?.showLoading(false)
        switch operation {
        case .fetchSession: view?.showMessage(title: fetchSessionText, message: "Error: \(error.errorDescription). \(error.recoverySuggestion)")
        case .signIn : view?.showMessage(title: signInText, message: "Error: \(error.errorDescription). \(error.recoverySuggestion)"
            )
        default: return
        }
    }
}
