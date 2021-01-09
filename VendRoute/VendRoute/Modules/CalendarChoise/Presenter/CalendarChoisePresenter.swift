//
//  CalendarChoisePresenter.swift
//  VendRoute
//
//  Created by Vasili Orlov on 14/09/2020.
//  Copyright © 2020 VR. All rights reserved.
//
import Foundation

class CalendarChoisePresenter: CalendarChoiseModuleInput, CalendarChoiseViewOutput {
    
    // dependencies
    weak var view: CalendarChoiseViewInput?
    var router: CalendarChoiseRouter
    var appSettings: AppSettings
    
    init(router: CalendarChoiseRouter, view: CalendarChoiseViewInput, appSettings: AppSettings) {
        self.view = view
        self.router = router
        self.appSettings = appSettings
    }
    //MARK: - CalendarChoiseViewOutput
    func viewIsReady() {
        view?.setupInitialState()
    }
    
    func selectedServiceDate(_ date: Date) {
        appSettings.serviceDate = date
        appSettings.dayIsStarted = true
    }
    
    func requireLoadData() {
        router.openLoadScreen()
    }
}
