//
//  UserDefaultsDao.swift
//  Arphys
//
//  Created by Vasili Orlov on 07/10/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

class UserDefaultsDao: UserDao {
    private let KeyUserLogin = "user.login"
    
    func save(_ user: AuthUser) {
        UserDefaults.standard.set(user.name, forKey: KeyUserLogin)
    }
    
    func get() -> AuthUser {
        return AuthUser(name: UserDefaults.standard.string(forKey: KeyUserLogin))
    }
    
    func clear() {
        UserDefaults.standard.removeObject(forKey: KeyUserLogin)
    }
}
