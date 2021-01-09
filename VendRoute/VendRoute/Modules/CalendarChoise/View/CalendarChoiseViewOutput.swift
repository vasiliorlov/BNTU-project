//
//  CalendarChoiseViewOutput.swift
//  VendRoute
//
//  Created by Vasili Orlov on 14/09/2020.
//  Copyright © 2020 VR. All rights reserved.
//
import Foundation

protocol CalendarChoiseViewOutput {

    /**
        @author Vasili Orlov
        Notify presenter that view is ready
    */

    func viewIsReady()
    func selectedServiceDate(_ date: Date)
    func requireLoadData()
}
