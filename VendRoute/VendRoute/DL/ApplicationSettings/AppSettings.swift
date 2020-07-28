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
    
    private let userDefaults = UserDefaults.standard
    
    //key
    private let kIsLogged = "bnty.vendroute.isLogged"
    
    //MARK: - private methods
    private func setIsLogged(value: Bool) {
        userDefaults.set(value, forKey: kIsLogged)
    }
    
    private func getIsLogged() -> Bool {
        return userDefaults.bool(forKey: kIsLogged)
    }
    
}
