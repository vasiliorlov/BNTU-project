//
//  UserDao.swift
//  Arphys
//
//  Created by Vasili Orlov on 07/10/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

protocol UserDao {
    func save(_ user: AuthUser)
    func get() -> AuthUser
    func clear()
}
