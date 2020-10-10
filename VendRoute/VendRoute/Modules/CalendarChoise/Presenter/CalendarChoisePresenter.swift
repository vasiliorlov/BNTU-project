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

    init(router: CalendarChoiseRouter, view: CalendarChoiseViewInput) {
        self.view = view
        self.router = router
    }

    func viewIsReady() {
	view?.setupInitialState()
    }
    
    func selectedServiceDate(_ date: Date) {
        
    }
}
