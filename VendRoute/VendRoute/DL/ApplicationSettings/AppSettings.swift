//
//  AppSettings.swift
//  VendRoute
//
//  Created by Vasili Orlov on 28/07/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit
protocol AppSettings {
    var isLogged: Bool { get set }
    var dayIsStarted: Bool { get set }
    var serviceDate: Date { get set }
}


class UserDefaultsAppSettingsImpl: AppSettings {
    var isLogged: Bool {
        get {
            return getIsLogged()
        }
        set(value) {
            setIsLogged(value: value)
        }
    }
    
    var dayIsStarted: Bool {
        get {
            return getDayIsStarted()
        }
        set(value) {
            setDayIsStarted(value: value)
        }
    }
    
    var serviceDate: Date {
        get {
            return getServiceDay()
        }
        set(value) {
            setServiceDay(value: value)
        }
    }
    
    private let userDefaults = UserDefaults.standard
    
    //key
    private let kIsLogged = "bnty.vendroute.isLogged"
     private let kDayIsStared = "bnty.vendroute.dayIsStarted"
     private let kServiceDay = "bnty.vendroute.serviceDay"
    
    //MARK: - private methods
    private func setIsLogged(value: Bool) {
        userDefaults.set(value, forKey: kIsLogged)
    }
    
    private func getIsLogged() -> Bool {
        return userDefaults.bool(forKey: kIsLogged)
    }
    
    private func setDayIsStarted(value: Bool) {
        userDefaults.set(value, forKey: kDayIsStared)
    }
    
    private func getDayIsStarted() -> Bool {
        return userDefaults.bool(forKey: kDayIsStared)
    }
    
    private func setServiceDay(value: Date) {
        userDefaults.set(value, forKey: kServiceDay)
    }
    
    private func getServiceDay() -> Date {
        return userDefaults.object(forKey: kServiceDay) as! Date
    }
    
}
