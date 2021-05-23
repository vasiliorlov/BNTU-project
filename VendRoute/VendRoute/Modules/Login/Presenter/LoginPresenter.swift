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
    private var appSettings: AppSettings
    private let userDao: UserDao
    private var userName: String?
    
    init(router: LoginRouter, view: LoginViewInput, authManager: AuthManager, appSettings: AppSettings, userDao: UserDao) {
        self.view = view
        self.router = router
        self.authManager = authManager
        self.appSettings = appSettings
        self.userDao = userDao
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
        self.userName = user.email
        let request = SignInRequest(username: user.email, password: user.password)
        authManager.signIn(request)
    }
}

//MARK: - AuthManagerOutput
extension LoginPresenter: AuthManagerOutput {
    func didSFetchSession(_ session: AuthSession) {}
    
    func didSuccessfully(_ operation: AuthOperation) {
        switch operation {
        case .signIn :
            view?.showLoading(false)
            appSettings.isLogged = true
            let user = AuthUser(name: self.userName)
            userDao.save(user)
            router.openCalendarScreen()
        default: return
        }
    }
    
    func didErrorOccuredOnOperation(_ operation: AuthOperation, error: AmplifyError) {
        view?.showLoading(false)
        switch operation {
        case .signIn : view?.showMessage(title: signInText, message: "Error: \(error.errorDescription). \(error.recoverySuggestion)"
        )
        default: return
        }
    }
}
