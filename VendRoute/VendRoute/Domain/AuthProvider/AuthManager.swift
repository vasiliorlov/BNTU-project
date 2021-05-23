//
//  AuthManager.swift
//  Arphys
//
//  Created by Vasili Orlov on 31/08/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//
import Amplify
import AWSMobileClient
import UIKit

struct AuthSession {
    let isSignedIn: Bool
}

struct AuthUser {
    let name: String?
}

struct SignInRequest {
    let username: String
    let password: String
}

struct SignUpRequest {
    let username: String
    let password: String
    let email: String
}

struct ConvifrmSignUpRequest {
    let username: String
    let code: String
}


protocol AuthManager {
    var output: AuthManagerOutput? { get set }
    var userState: UserState { get}
    
    func fetchCurrentAuthSession()
    
    func signIn(_ request: SignInRequest)
    func socialSignInWithWebUI(provider: AuthProvider, window: UIWindow)
    func signUp(_ request: SignUpRequest)
    func signOut()
    func convifrmSignUp(_ request: ConvifrmSignUpRequest)
}

enum AuthOperation {
    case fetchSession
    case signIn
    case signUp
    case confirm
    case signOut
}

protocol AuthManagerOutput: class {
    func didSFetchSession(_ session: AuthSession)
    func didSuccessfully(_ operation: AuthOperation)
    func didErrorOccuredOnOperation(_ operation:AuthOperation, error: AmplifyError)
}

class AmplifyAuthManager: AuthManager {
    private let userDao: UserDao
    weak var output: AuthManagerOutput?
    var userState: UserState {
        return getUserState()
    }
    //MARK: - init
    init(userDao: UserDao) {
        self.userDao = userDao
    }
    
    //MARK: - AuthManager
    func getUserState() -> UserState {
        switch( AWSMobileClient.default().currentUserState) {
        case .signedIn:
            DispatchQueue.main.async {
                print("Logged In")
            }
        case .signedOut:
            DispatchQueue.main.async {
                print("Signed Out")
            }
        default:
            AWSMobileClient.default().signOut()
        }
        return AWSMobileClient.default().currentUserState
    }
    
    func fetchCurrentAuthSession() {
        _ = Amplify.Auth.fetchAuthSession { result in
            switch result {
            case .success(let session):
                print("Is user signed in - \(session.isSignedIn)")
                let authSession = AuthSession(isSignedIn: session.isSignedIn)
                self.output?.didSFetchSession(authSession)
            case .failure(let error):
                self.output?.didErrorOccuredOnOperation(.fetchSession, error: error)
                print("Fetch session failed with error \(error)")
            }
        }
    }
    
    func signIn(_ request: SignInRequest) {
        Amplify.Auth.signIn(username: request.username, password: request.password) { result in
            switch result {
            case .success:
                print("Sign in succeeded")
                self.output?.didSuccessfully(.signIn)
            case .failure(let error):
                print("Sign in failed \(error)")
                self.output?.didErrorOccuredOnOperation(.signIn, error: error)
            }
        }
    }
    
    func socialSignInWithWebUI(provider: AuthProvider, window: UIWindow) {
        Amplify.Auth.signInWithWebUI(for: provider, presentationAnchor: window) { result in
            switch result {
            case .success:
                print("Sign in succeeded")
                self.output?.didSuccessfully(.signIn)
            case .failure(let error):
                print("Sign in failed \(error)")
                self.output?.didErrorOccuredOnOperation(.signIn, error: error)
            }
        }
    }
    
    func signUp(_ request: SignUpRequest) {
        let userAttributes = [AuthUserAttribute(.email, value: request.email)]
        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
        Amplify.Auth.signUp(username: request.username, password: request.password, options: options) { result in
            switch result {
            case .success(let signUpResult):
                if case let .confirmUser(deliveryDetails, _) = signUpResult.nextStep {
                    self.output?.didSuccessfully(.signUp)
                    print("Delivery details \(String(describing: deliveryDetails))")
                } else {
                    self.output?.didSuccessfully(.signUp)
                    print("SignUp Complete")
                }
            case .failure(let error):
                self.output?.didErrorOccuredOnOperation(.signUp, error: error)
                print("An error occurred while registering a user \(error)")
            }
        }
    }
    
    func signOut() {
        Amplify.Auth.signOut() { result in
            switch result {
            case .success:
                 self.output?.didSuccessfully(.signOut)
                print("Successfully signed out")
            case .failure(let error):
                self.output?.didErrorOccuredOnOperation(.signOut, error: error)
                print("Sign out failed with error \(error)")
            }
        }
    }
    
    func convifrmSignUp(_ request: ConvifrmSignUpRequest) {
        Amplify.Auth.confirmSignUp(for: request.username, confirmationCode: request.code) { result in
            switch result {
            case .success:
                self.output?.didSuccessfully(.confirm)
                print("Confirm signUp succeeded")
            case .failure(let error):
                self.output?.didErrorOccuredOnOperation(.confirm, error: error)
                print("An error occurred while confirming sign up \(error)")
            }
        }
    }

}

