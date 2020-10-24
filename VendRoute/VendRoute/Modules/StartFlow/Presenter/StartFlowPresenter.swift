//
//  StartFlowPresenter.swift
//  VendRoute
//
//  Created by Vasili Orlov on 24/10/2020.
//  Copyright © 2020 VR. All rights reserved.
//

class StartFlowPresenter: StartFlowModuleInput, StartFlowViewOutput {
    
    // dependencies
    weak var view: StartFlowViewInput?
    var router: StartFlowRouter
    var appSettings: AppSettings
    
    init(router: StartFlowRouter, view: StartFlowViewInput, appSettings: AppSettings) {
        self.view = view
        self.router = router
        self.appSettings = appSettings
    }
    
    //MARK: - StartFlowViewOutput
    func viewIsReady() {
        view?.setupInitialState()
        
        if appSettings.isLogged {
            router.openPosListScreen()
        } else {
            router.openLoginScreen()
        }
    }
}
